#!/bin/bash

source $APPINST_BASEDIR/src/helpers/colors.sh
BASEDIR="$APPINST_BASEDIR/src"

# check if prev instaled
if which -a "azuredatastudio"; then
  show_info_log "Azure Data Studio already installed!"
else
  show_info_log "Downloading Azure Data Studio"
  wget https://go.microsoft.com/fwlink/?linkid=2215528 -O /tmp/azuredatastudio.deb

  show_info_log "Installing Azure Data Studio"
  sudo apt install /tmp/azuredatastudio.deb
  rm /tmp/azuredatastudio.deb
fi

show_info_input "Do you want to install Custom Extensions? [y:n]"
read add_extensions

install_vsix() {
  vsi_name=$1
  vsi_link=$2

  wget $vsi_link -O /tmp/$vsi_name.vsix
  azuredatastudio --force --install-extension /tmp/$vsi_name.vsix
  rm /tmp/$vsi_name.vsix
}

# if user press Yes
if [ "$add_extensions" = 'y' ]; then
  show_info_log "Installing Azure Data Studio Extensions..."

  show_info_log "Poor SQL Formatter"
  install_vsix poor-sql-formatter https://github.com/wsr-publishing/azure-poor-formatter/releases/download/v0.1.0/poor-sql-formatter-0.1.0.vsix
fi

show_success_log "Azure Data Studio successfully installed"
