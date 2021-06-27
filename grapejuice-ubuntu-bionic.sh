#!/bin/bash
sudo 
sudo dpkg --add-architecture i386
wget -nc https://dl.winehq.org/wine-builds/winehq.key -O /tmp/winehq.key
sudo apt-key add /tmp/winehq.key
sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main'
wget https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_18.04/i386/libfaudio0_19.07-0~bionic_i386.deb -O /tmp/faudio_i386.deb
wget https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_18.04/amd64/libfaudio0_19.07-0~bionic_amd64.deb -O /tmp/faudio_amd64.deb
sudo apt install -y /tmp/faudio_i386.deb
sudo apt install -y /tmp/faudio_amd64.deb
sudo apt install -y software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt upgrade -y
sudo apt install -y wine-stable git pkg-config python3.7 python3.7-dev python3-pip libcairo2-dev libgirepository1.0-dev libgtk-3-0 libgtk-3-bin libdbus-1-dev gir1.2-gtk-3.0
git clone https://gitlab.com/brinkervii/grapejuice.git
python3.7 ./grapejuice/install.py
rm -rf grapejuice
~/.local/bin/grapejuice gui
