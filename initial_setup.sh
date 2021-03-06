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

# (Optional) to run docker without 'sudo'
sudo groupadd docker
sudo usermod -aG docker $USER

# Install docker-machine
curl -L https://github.com/docker/machine/releases/download/v0.12.2/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine &&
chmod +x /tmp/docker-machine &&
sudo cp /tmp/docker-machine /usr/local/bin/docker-machine

# Install pip
sudo apt install python-pip

# Install virtual box
sudo apt-get install virtualbox
# virtualbox on 16.04 will likely require secure boot being turned off
# https://askubuntu.com/a/797442/424657 for info on why
# https://askubuntu.com/a/465455/424657 for commands to run if problem is encountered

# Install OpenJDK (Java8)
# http://zulu.org/zuludocs-folder/#ZuluUserGuide/PrepareZuluPlatform/AttachAPTRepositoryUbuntuOrDebianSys.htm
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0x219BD9C9
sudo apt-add-repository 'deb http://repos.azulsystems.com/ubuntu stable main'
sudo apt-get update
sudo apt-get install zulu-8

# Install flux
sudo add-apt-repository ppa:nathan-renniewaldock/flux
sudo apt-get update
sudo apt-get install fluxgui

# Install R
sudo apt-get install r-base
# libraries won't install to site-library per https://stackoverflow.com/a/36696488/3691003
sudo chmod o+w /usr/local/lib/R/site-library

# Install tree
sudo apt-get install tree

# Install pandoc?
sudo apt-get install pandoc 

# Install latex
sudo apt-get install texlive

# Install npm
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo npm install npm --global

# Install electron
npm install electron --save-dev --save-exact

