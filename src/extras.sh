#!/bin/bash

source $APPINST_BASEDIR/src/helpers/colors.sh

show_info_log "Installing..." &&
sudo apt install -y ubuntu-restricted-extras \
  unace \
  unrar \
  zip \
  unzip \
  p7zip-full \
  p7zip-rar \
  sharutils \
  rar &&

show_success_log "Codecs successfully installed"
