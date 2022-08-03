#!/bin/bash

source $APPINST_BASEDIR/src/helpers/colors.sh
source $APPINST_BASEDIR/src/helpers/ubuntu_universe.sh

show_info_log "Removing old version"
sudo apt remove -y docker docker-engine docker.io containerd runc

show_info_log "Setting up environment!"
sudo apt install -y apt-transport-https ca-certificates curl gnupg software-properties-common &&

show_info_log "Installing..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(find_universe) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update &&
sudo apt install -y docker-ce docker-ce-cli containerd.io &&
sudo groupadd docker
sudo usermod -aG docker $USER &&

show_success_log "Docker successfully installed"
