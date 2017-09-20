#!/usr/bin/env bash

# INITIAL SETUP OF STUFF FOLLOWING NEW INSTALL OF 16.04.X

# Install vim
sudo apt-get install vim

# Install chrome
# known issue: https://askubuntu.com/a/765039
echo "deb http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list  
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -  
sudo apt-get update  
sudo apt-get install google-chrome-stable

# Install spotify
echo 'deb http://repository.spotify.com stable non-free' | sudo tee --append /etc/apt/sources.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
sudo apt-get update && sudo apt-get install spotify-client

# Install skype
wget https://repo.skype.com/latest/skypeforlinux-64.deb
sudo dpkg -i skypeforlinux-64.deb
sudo apt install -f
rm -f skypeforlinux-64.deb

# Install TLP (battery mgmt for laptops)
sudo add-apt-repository ppa:linrunner/tlp
sudo apt update
sudo apt install tlp tlp-rdw

# Install Docker-ce
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable"
sudo apt-get update
sudo apt-get install docker-ce

# Install pip
sudo apt install python-pip
