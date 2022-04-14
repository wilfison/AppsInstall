#!/bin/bash

green="\033[0;32m"
blue="\033[0;34m"
close_color="\033[0m"

echo -e "$green Installing essential tools.. $close_color" &&
sudo apt install git -y &&

echo -e "$green Downloading installer... $close_color" &&
mkdir -p $HOME/Apps
cd $HOME/Apps &&
rm -rf -f ./AppInstall
sudo rm -f $HOME/.local/share/applications/AppInstall.desktop

git clone https://github.com/Wilfison/AppsInstall AppInstall

sudo cp ./AppInstall/AppInstall.desktop /usr/share/applications &&
sudo ln -sf $HOME/Apps/AppInstall/AppInstall.sh /usr/bin/devinstall &&

clear

echo -e "$green App Install successfully installed 🎉🎉🎉 $close_color"
echo -e "Now look for App Install in your applications menu or run$blue appinstall$close_color on your terminal"
