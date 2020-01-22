#!/bin/bash

source $HOME/.local/share/AppInstall/components/helpers/colors.sh
source $HOME/.local/share/AppInstall/components/helpers/profile.sh

nodeversion=$( dialog --stdout --title 'Version to Install' --menu 'Version stable to Install' 0 40 3 \
  10 "10.x" \
  11 "11.x" \
  12 "12.x"
)

if [ $? = 1 ]; then
  clear && exit 1;
fi

NODE_LINK="https://deb.nodesource.com/setup_$nodeversion.x"

echo -e "$green Installing required components! $close_color"
sudo apt install -y build-essential &&

echo -e "$green Download installer $close_color"
curl -sL $NODE_LINK | sudo -E bash - &&

echo -e "$green Installing... $close_color"
sudo apt install nodejs -y &&

echo -e "$green Updating system variables! $close_color"
sudo chown -R $(whoami) /usr/local/lib/node_modules &&
source $MY_PROFILE &&

echo -e "$green Node successfully installed! You can use NPM without sudo $close_color"
