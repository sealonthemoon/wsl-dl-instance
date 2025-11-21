#!/bin/bash

TARGET="/home/seal"
COUNT=0

# Safety check
if [[ ! -d "$TARGET" ]]; then
    echo "Error: $TARGET does not exist."
    exit 1
fi

echo "Starting ownership update in $TARGET ..."
echo "------------------------------------------------"

# Traverse all files and directories under /home/seal
find "$TARGET" -mindepth 1 | while read -r item; do
    basename_item=$(basename "$item")
    if [[ "$basename_item" == "youtube-dl" ]]; then
        echo "Skipping: $item (excluded)"
    else
        echo "Changing ownership: $item"
        sudo chown seal "$item"
        if [[ $? -eq 0 ]]; then
            echo "Success: $item is now owned by the current user ($TARGET)"
	    COUNT=$((COUNT+1))
        else
            echo "Failed: could not change ownership of $item"
        fi
    fi
done

echo "------------------------------------------------"
echo "Ownership update complete."
echo "Total files changed : $COUNT"

