#!/bin/bash

TARGET="/home/seal/audio"
COUNT=0

# Safety check: ensure the directory exists
if [[ ! -d "$TARGET" ]]; then
    echo "Error: $TARGET does not exist."
    exit 1
fi

# Console output
echo "Removing all directories and files in : $TARGET"

# Loop through items in the target directory
for item in "$TARGET"/*; do
    if [[ -d "$item" ]]; then
        echo "Removing directory: $item"
        rm -rf "$item"
    elif [[ -f "$item" && "$(basename "$item")" != "empty.sh" ]]; then
        echo "Skipping file: $item"
    fi
done

echo "--------------------------------------------------------"
echo "Cleanup complete."
echo "Total files removed : $COUNT"
