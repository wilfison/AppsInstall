#!/bin/bash

source $APPINST_BASEDIR/src/helpers/colors.sh
source $APPINST_BASEDIR/src/helpers/profile.sh


show_info_input "Version stable to Install: (14, 15, 16, 17...)" &&
read nodeversion

if [ -z "$nodeversion" ]; then
  clear && exit 1;
fi

NODE_LINK="https://deb.nodesource.com/setup_$nodeversion.x"

show_info_log "Installing required components!"
sudo apt install -y build-essential &&

show_info_log "Download installer"
curl -sL $NODE_LINK | sudo -E bash - &&

show_info_log "Installing..."
sudo apt install nodejs -y &&

show_info_log "Updating system variables!"
sudo chown -R $(whoami) /usr/local/lib/node_modules &&
source $MY_PROFILE &&

show_info_log "Node successfully installed! You can use NPM without sudo"
