#!/bin/bash

source $HOME/.local/share/AppInstall/components/helpers/colors.sh

echo -e "$green Adding PPA $close_color" &&
sudo add-apt-repository ppa:openjdk-r/ppa -y &&

echo -e "$green Updating... $close_color" &&
sudo apt update &&

echo -e "$green Installing... $close_color" &&
sudo apt install openjdk-8-jdk -y &&

echo -e "$green Open Jdk successfully installed $close_color"