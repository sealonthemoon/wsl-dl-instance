# wsl-dl-instance

Complete solution for downloading YouTube audio.

## Semi-automated installation

### Prerequisites

For this setup, we will use WSL.

To check if WSL is installed, type the following command in a PowerShell window:

```Powershell
wsl --list --online
```

Install WSL using:

```Powershell
wsl --install
```

Make sure to run the above command with Administrator priviledges.

Next, list available packages and install an Ubuntu instance:

```Powershell
wsl --list --online     # Available images
wsl --list              # Installed images
wsl --install Ubuntu    # Install Ubuntu
wsl                     # Open WSL Ubuntu
```

Go through the configuration setup.

Once finished, navigate to the user home folder and install basic packages needed to deploy:

*example*

```bash
seal@dseal:/mnt/c/Users/sealo$ cd ~
seal@dseal:~$ pwd
/home/seal
seal@dseal:~$ sudo apt install git -y
```

*copy*

```bash
cd ~
```

```bash
sudo apt install git -y
```

Clone the Github repo:

```bash
git clone https://github.com/sealonthemoon/wsl-dl-instance.git
```

### Run automated script

Run the installation script:

*example*

```bash
seal@dseal:~$ sudo chmod +x ./wsl-dl-instance/install.sh
seal@dseal:~$ D=$(pwd)
seal@dseal:~$ sudo ./wsl-dl-instance/install.sh $D
```

*copy*

```bash
sudo chmod +x ./wsl-dl-instance/install.sh
```

```bash
D=$(pwd)
```

```bash
sudo ./wsl-dl-instance/install.sh $D
```
All done!

## Files

- audio/ : directory that holds all audio downloaded by the text file method.
- commands : usage guide
- dl.txt : download text file list, only YT URLs allowed
- empty.sh : deletes all files in the download folder
- mp3.sh : download list of mp3s, defined in dl.txt
- wav.sh : download list of wavs, defined in dl.txt
- owner.sh : make yourself owner of all files in the directory
- setup.sh : change path in all scripts and usage guide to ~
- youtube-dl : download application

## References

- Install guide: https://itsfoss.com/download-youtube-linux/#download-youtube-videos-in-various-formats-and-quality-size
- Source code: https://github.com/ytdl-org/ytdl-nightly/releases
