#!/bin/bash

# Get current working directory
CURRENT_DIR=$(pwd)
COUNT=0

echo "Replacing '/home/seal' with '$CURRENT_DIR' in all .sh files..."
echo "------------------------------------------------"

# Loop through all .sh files in the current directory
for file in *.sh; do
    if [[ -f "$file" ]]; then
        if [[ "$(basename "$file")" == "setup.sh" ]]; then
            echo "Skipping: $file (no changes applied)"
        else
            echo "Processing: $file"
            # Use sed to replace text in-place
            sed -i "s|/home/seal|$CURRENT_DIR|g" "$file"
            echo "Updated: $file"
            COUNT=$((COUNT+1))
        fi
    fi
done

# Change directory in commands file
if [[ -f "commands" ]]; then
    echo "Updating commands file..."
    sed -i "s|/home/seal|$CURRENT_DIR|g" commands
    echo "Updated: commands"
    COUNT=$((COUNT+1))
fi

echo "------------------------------------------------"
echo "Replacement complete."
echo "Total files changed : $COUNT"
