#!/bin/bash

set -e

BASEDIR="$APPINST_BASEDIR/src"
source $BASEDIR/helpers/colors.sh

export $RUNZSH=no
export $ZSH_CUSTOM=~/.oh-my-zsh/custom

show_info_log "Installing dependencies..."
sudo apt install -y zsh git curl

show_info_log "Installing Oh My ZSH..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

show_info_log "Installing Autosuggestions..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# update plugins list on .zshrc
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions)/g' ~/.zshrc

show_info_log "ZSH successfully installed"
show_info_log "You need to reboot the system to complete instalation!"

show_info_input "Do you want to reboot now? [y:n]"
read reboot_now

# if user press Yes
if [ "$reboot_now" = 'y' ]; then
  systemctl reboot
fi
