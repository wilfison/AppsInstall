#!/bin/bash

BASEDIR=$("$APPINST_BASEDIR/components")
source $BASEDIR/helpers/colors.sh

show_info_log "Installing..." &&
sudo apt install zsh git -y &&

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" &&
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)" &&

show_info_log "Setting as Default SHELL!" &&
sudo chsh -s /bin/zsh &&

echo "zinit light zdharma/fast-syntax-highlighting" >> ~/.zshrc
echo "zinit light zsh-users/zsh-autosuggestions" >> ~/.zshrc
echo "zinit light zsh-users/zsh-completions" >> ~/.zshrc

show_info_input "Do you want to install Aliases? [y:n]"
read add_aliases

# if user press Yes
if [ "$add_aliases" = 'y' ]; then
  show_info_log "Config Aliases..."
  mv $BASEDIR/config/aliases.sh ~/.aliases.sh &&
  
  echo -e "\nsource ~/.aliases.sh" >> ~/.zshrc &&
  show_info_log "Aliases successfully installed in ~/.aliases.sh"
fi

show_info_log "ZSH successfully installed"
show_info_log "You need to reboot the system to complete instalation!"

show_info_input "Do you want to reboot now? [y:n]"
read reboot_now

# if user press Yes
if [ "$reboot_now" = 'y' ]; then
  systemctl reboot
fi
