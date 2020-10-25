#!/bin/bash

source $HOME/.local/share/AppInstall/components/helpers/colors.sh

echo -e "$green Downloading installer... $close_color" &&
cd ~/ &&
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&

echo -e "$green Installing... $close_color" &&
sudo dpkg -i google-chrome-stable_current_amd64.deb &&
rm google-chrome-stable_current_amd64.deb &&

echo -e "$green Google Chrome successfully installed $close_color"
