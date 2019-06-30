#!/bin/bash

source $(dirname "$0")/colors.sh

echo -e "$green Installing Access Key! $close_color" &&
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg &&
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg &&
sudo sh -c 'echo -e "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' &&

echo -e "$green Updating... $close_color" &&
sudo apt update &&

echo -e "$green Installing VS Code $close_color" &&
sudo apt install code -y &&

echo -e "$green VS Code successfully installed $close_color"