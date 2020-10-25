#!/bin/bash

source $HOME/.local/share/AppInstall/components/helpers/colors.sh

echo -e "$green Removing old version $close_color"
sudo apt remove -y docker docker-engine docker.io containerd runc &&

echo -e "$green Setting up environment! $close_color"
sudo apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common &&

echo -e "$green Installing... $close_color"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - &&
sudo apt install -y docker-ce docker-ce-cli containerd.io &&
sudo apt update &&
sudo groupadd docker &&
sudo usermod -aG docker $USER &&

echo -e "$green Docker successfully installed $close_color"
