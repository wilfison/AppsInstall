#!/bin/bash

source $APPINST_BASEDIR/src/helpers/colors.sh

appinst_file="google-chrome-stable_current_amd64.deb"

show_info_log "Downloading installer..." &&
cd $APPINST_APPS_PATH &&
wget "https://dl.google.com/linux/direct/$appinst_file" &&

show_info_log "Installing..." &&
sudo dpkg -i $appinst_file &&
rm $appinst_file &&

show_success_log "Google Chrome successfully installed"
