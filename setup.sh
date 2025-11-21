#!/bin/bash

# First argument: home folder of the user (e.g. /home/henk)
if [[ -z "$1" ]]; then
    echo "Usage: $0 /home/username"
    exit 1
fi

USER_HOME="$1"
USER_NAME=$(basename "$USER_HOME")

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
echo "Now replacing 'seal' with correct user: $USER_NAME"
echo "------------------------------------------------"

# Second loop: replace 'seal' with actual user name
for file in *.sh; do
    if [[ -f "$file" ]]; then
        if [[ "$(basename "$file")" == "setup.sh" ]]; then
            echo "Skipping: $file (no changes applied)"
        else
            echo "Processing user replacement in: $file"
            sed -i "s|\bseal\b|$USER_NAME|g" "$file"
            echo "Updated user in: $file"
            COUNT=$((COUNT+1))
        fi
    fi
done

# Also update commands file
if [[ -f "commands" ]]; then
    echo "Updating user in commands file..."
    sed -i "s|\bseal\b|$USER_NAME|g" commands
    echo "Updated user in: commands"
    COUNT=$((COUNT+1))
fi

echo "------------------------------------------------"
echo "Replacement complete."
echo "Total files changed : $COUNT"