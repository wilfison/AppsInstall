#!/bin/bash

source $HOME/.local/share/AppInstall/components/helpers/colors.sh

echo -e "$green Installing... $close_color" &&
sudo apt install zsh -y &&
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" &&

echo -e "$green Setting as Default SHELL! $close_color" &&
chsh -s /bin/zsh &&

echo -e "$green ZSH successfully installed $close_color"
echo -e "$green You need to reboot the system to comple instalation! $close_color"