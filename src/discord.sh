#!/bin/bash

source $APPINST_BASEDIR/src/helpers/colors.sh

appinst_file="$APPINST_APPS_PATH/discord.deb"

show_info_log "Downloading installer..." &&
  wget "https://discord.com/api/download/stable?platform=linux&format=deb" -O $appinst_file &&
  show_info_log "Installing..." &&
  sudo dpkg -i $appinst_file &&
  rm $appinst_file &&
  show_success_log "Discord successfully installed"
