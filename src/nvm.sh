#!/bin/bash

source $APPINST_BASEDIR/src/helpers/colors.sh
source $APPINST_BASEDIR/src/helpers/profile.sh

show_info_log "Installing required components!" &&
sudo apt install build-essential checkinstall libssl-dev -y &&

show_info_log "Downloading installer" &&
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash &&

show_info_log "Updating system variables!" &&
echo "export NVM_DIR='$HOME/.nvm'
[ -s '$NVM_DIR/nvm.sh' ] && \. '$NVM_DIR/nvm.sh'
[ -s '$NVM_DIR/bash_completion' ] && \. '$NVM_DIR/bash_completion'" >> $MY_PROFILE &&

source $MY_PROFILE &&
command -v nvm &&

show_info_log "NVM successfully installed on version:" &&
nvm --version

show_info_log "You need to reboot the system to complete instalation!"

show_info_input "Do you want to reboot now? [y:n]"
read reboot_now

# if user press Yes
if [ "$reboot_now" = 'y' ]; then
  systemctl reboot
fi
