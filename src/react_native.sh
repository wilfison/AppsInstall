#!/bin/bash

source $APPINST_BASEDIR/src/helpers/colors.sh

show_info_log "Setting up environment!" &&
sudo apt install -y autoconf automake build-essential python-dev git &&

show_info_log "Installing..." &&
npm install -g react-native-cli &&

show_success_log "React Native successfully installed!"
