#!/bin/bash

source $(readlink -f .)/components/helpers/colors.sh
source $(readlink -f .)/helpers/profile.sh

echo -e "$red Press ENTER to install Latest Current Version!  $close_color"
echo -e -n "$green Version: [ 10, 11, 12 ] $close_color"
read nodeversion

if [ -z $nodeversion ]; then
  nodeversion=12
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
