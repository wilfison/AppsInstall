#!/bin/bash

source $HOME/.local/share/AppInstall/components/helpers/colors.sh &&

echo -e "$green Installing required components! $close_color"
sudo apt install build-essential -y &&
echo -e "$green Installing SSH $close_color"
sudo apt install ssh -y &&
echo -e "$green Installing o GIT $close_color"
sudo apt install git -y &&

set_git_user=$(dialog --stdout --title "Git Install" --yesno "Would you like to setup your git user now?" 8 60)

if [ $? = 1 ]; then
  clear
  echo -e "$green Git successfully installed! $close_color"
  exit 1;
fi

git_user=$(dialog --stdout --title "Git Install" --inputbox "Your git user:" 8 60)
git_email=$(dialog --stdout --title "Git Install" --inputbox "Your git email:" 8 60)

if [ -z $git_user || -z $git_email ]; then
  echo -e "$red ✗ ERRO: $close_color fill in the data correctly!"
  exit 1;
fi

git config --global user.name "$git_user" &&
git config --global user.email "$git_email" &&

dialog --title 'Git Install' --msgbox " Configured successfully: \n\n Username: $git_user \n Email: $git_email \n" 0 0

echo -e "$green Git installed successfully: $close_color"