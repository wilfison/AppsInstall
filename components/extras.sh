#!/bin/bash

source $HOME/.local/share/AppInstall/components/helpers/colors.sh

echo -e "$green Installing... $close_color" &&
sudo apt install -y ubuntu-restricted-extras vlc unace unrar zip unzip p7zip-full p7zip-rar sharutils rar &&

echo -e "$green Codecs successfully installed $close_color"