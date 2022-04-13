#!/bin/bash

green="\033[0;32m"
blue="\033[0;34m"
close_color="\033[0m"

echo -e "$green Installing essential tools.. $close_color" &&
sudo apt install git -y &&

echo -e "$green Downloading installer... $close_color" &&
cd ~/.local/share/ &&
rm -rf -f ./AppInstall
rm -f ./applications/AppInstall.desktop

git clone https://github.com/Wilfison/AppsInstall AppInstall &&

sudo cp ./AppInstall/AppInstall.desktop /usr/share/applications &&
cd AppInstall &&
bundle config set --local without test development &&
bundle install &&
sudo ln -sf ./run.sh /usr/bin/appinstall &&

clear

echo -e "$green App Install successfully installed 🎉🎉🎉 $close_color"
echo -e "Now look for App Install in your applications menu or run$blue appinstall$close_color on your terminal"
