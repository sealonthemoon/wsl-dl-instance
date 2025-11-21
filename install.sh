#!/bin/bash

echo "---------------------------------------------"
echo "Setting directories..."
DIR=$1
REPO="$DIR/wsl-dl-instance"
echo "Done!"

echo "Installing packages..."
sudo apt update -y && sudo apt upgrade -y
sudo apt install -y git nano wget ffmpeg pip python3
echo "Done!"

echo "Installing youtube-dl..."
sudo cp $REPO/youtube-dl /usr/local/bin/
sudo chmod a+rx /usr/local/bin/youtube-dl
alias youtube-dl='python3 /usr/local/bin/youtube-dl'
alias ydl='python3 /usr/local/bin/youtube-dl'
echo "Done!"

echo "Moving files to $DIR..."
sudo cp -r $REPO/* $DIR
echo "Done!"

echo "Cleaning up..."
sudo rm -rf $REPO
sudo rm -r $DIR/youtube-dl
cd $DIR | ls
echo "Done!"

echo "---------------------------------------------"
echo "==> youtube-dl has successfully been installed"
echo "=> run 'youtube-dl --help' for more info"
echo "=> or run 'python3 /usr/local/bin/youtube-dl --help' if the above does not work"