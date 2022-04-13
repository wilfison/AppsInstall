#!/bin/bash

BASEDIR=$HOME/.local/share/AppInstall/components
source $BASEDIR/helpers/colors.sh

echo -e "$green Installing... $close_color" &&
sudo apt install zsh git -y &&

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" &&
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)" &&

echo -e "$green Setting as Default SHELL! $close_color" &&
chsh -s /bin/zsh &&

echo "zinit light zdharma/fast-syntax-highlighting" >> ~/.zshrc
echo "zinit light zsh-users/zsh-autosuggestions" >> ~/.zshrc
echo "zinit light zsh-users/zsh-completions" >> ~/.zshrc

echo -ne "$blue Do you want to install Aliases? [y:n] $close_color"
read add_aliases

# if user press Yes
if [ "$add_aliases" = 'y' ]; then
  echo -e "$green Config Aliases... $close_color"
  mv $BASEDIR/config/aliases.sh ~/.aliases.sh &&
  
  echo -e "\nsource ~/.aliases.sh" >> ~/.zshrc &&
  echo -e "$green Aliases successfully installed in ~/.aliases.sh $close_color"
fi

echo -e "$green ZSH successfully installed $close_color"
echo -e "$green You need to reboot the system to complete instalation! $close_color"

echo -ne "$blue Do you want to reboot now? [y:n] $close_color"
read reboot_now

# if user press Yes
if [ "$reboot_now" = 'y' ]; then
  systemctl reboot
fi
