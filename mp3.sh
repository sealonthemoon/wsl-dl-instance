#!/bin/bash

DLFILE="/home/seal/dl.txt"
BASEDIR="/home/seal/audio"

# Check if dl.txt exists and is not empty
if [[ ! -s "$DLFILE" ]]; then
    echo "Error: $DLFILE is empty or does not exist."
    exit 1
fi

# Create new directory variable with timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
NEWDIR="$BASEDIR/audio_$TIMESTAMP"
COUNT=0

# Console output
echo "INPUT : $DLFILE"
echo "OUTPUT : $NEWDIR"
echo "------------------------------------------------"

# Create new directory
mkdir -p "$NEWDIR"
cd "$NEWDIR" || { echo "Failed to cd into $NEWDIR"; exit 1; }

# Loop over each link in dl.txt
while IFS= read -r link; do
    if [[ -n "$link" ]]; then
        echo "===> Downloading audio from: $link"
	sudo python3 /usr/local/bin/youtube-dl --user-agent "Mozilla/5.0" -x --audio-format mp3 --audio-quality 0 "$link"
	echo "Done!"
	COUNT=$((COUNT+1))
    fi
done < "$DLFILE"

# Copy dl.txt contents to audiolist.txt in new directory
cp "$DLFILE" "$NEWDIR/audiolist.txt"

# Clear dl.txt
> "$DLFILE"

echo "------------------------------------------------"
echo "All downloads complete. Links saved to $NEWDIR/audiolist.txt"
echo "Total files downloaded : $COUNT"
