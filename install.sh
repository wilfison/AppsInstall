#!/bin/bash

green="\033[0;32m"
blue="\033[0;34m"
close_color="\033[0m"

echo -e "$green Downloading installer... $close_color" &&
wget https://github.com/Wilfison/AppsInstall/archive/master.zip -O ~/AppInstall.zip &&
unzip ~/AppInstall.zip -d ~/ &&
rm -rf -f ~/.local/share/AppInstall &&
rm -f ~/.local/share/applications/AppInstall.desktop &&
mv ~/AppsInstall-master ~/.local/share/AppInstall &&
sudo mv ~/.local/share/AppInstall/AppInstall.desktop /usr/share/applications &&
sudo ln -sf ~/.local/share/AppInstall/AppInstall.sh /usr/bin/appinstall &&
rm ~/AppInstall.zip &&
clear &&
echo -e "$green App Install successfully installed $close_color" &&
echo -e "Now look for App Install in your applications menu or run$blue appinstall$close_color on your terminal"