#!/bin/bash

source $APPINST_BASEDIR/components/helpers/colors.sh
source $APPINST_BASEDIR/components/helpers/profile.sh


echo -ne "$blue Version stable to Install: (14, 15, 16, 17...) $close_color" &&
read nodeversion

if [ -z "$nodeversion" ]; then
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
