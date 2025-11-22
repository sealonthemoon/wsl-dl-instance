#!/bin/bash

echo "---------------------------------------------"
echo "==> Setting directories..."
DIR=$1
REPO="$DIR/wsl-ubuntu-youtube-dl"

echo "==> Installing packages..."
sudo apt update -y && sudo apt upgrade -y
sudo apt install -y git nano wget ffmpeg pip python3

echo "==> Installing youtube-dl..."
sudo cp "$REPO/youtube-dl" /usr/local/bin/
sudo chmod a+rx /usr/local/bin/youtube-dl
alias youtube-dl='python3 /usr/local/bin/youtube-dl'
alias ydl='python3 /usr/local/bin/youtube-dl'

echo "==> Moving files to $DIR..."
sudo cp -r "$REPO"/* "$DIR"

echo "==> Cleaning up..."
sudo rm -rf "$REPO"
sudo rm -r "$DIR/youtube-dl"
sudo mkdir -p "$DIR/audio"
cd "$DIR" | ls
echo "==> Done!"
echo "---------------------------------------------"

echo "==> Updating paths in scripts..."
sudo chmod +x "$DIR"/*.sh
sudo "$DIR/setup.sh" "$DIR"
echo "==> Done!"
echo "---------------------------------------------"

echo "==> Making user owner..."
sudo chmod +x "$DIR"/*.sh
sudo "$DIR/owner.sh"
echo "Done!"

echo "---------------------------------------------"
echo "==> youtube-dl has successfully been installed"
echo "=> run 'python3 /usr/local/bin/youtube-dl --help' for more info"
echo "=> run 'sudo alias youtube-dl='python3 /usr/local/bin/youtube-dl'' to set an alias"
