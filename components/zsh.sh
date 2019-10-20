#!/bin/bash

BASEDIR=$HOME/.local/share/AppInstall/components
source $BASEDIR/helpers/colors.sh

echo -e "$green Installing... $close_color" &&
sudo apt install zsh -y &&
sudo apt install git -y &&

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" &&

echo -e "$green Setting as Default SHELL! $close_color" &&
chsh -s /bin/zsh &&

add_aliases=$(dialog --title "Aliases" --yesno "Do you want to install Aliases?" 8 60 2>&1 >/dev/tty)

# if user press Yes
if [ $? = 0 ]; then
  echo -e "$green Config Aliases... $close_color"
  mv ~/.zshrc ~/.zshrc_temp &&
  cat ~/.zshrc_temp $BASEDIR/config/aliases.sh > ~/.zshrc &&
fi


echo -e "$green ZSH successfully installed $close_color"
echo -e "$green You need to reboot the system to complete instalation! $close_color"