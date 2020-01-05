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

# Set git configs
git config --global user.name "$git_user" &&
git config --global user.email "$git_email" &&


set_ssh_key=$(dialog --stdout --title "Git Install" --yesno "Would you like to generate a public SSH key now?" 8 60)

if [ $? = 1 ]; then
  clear
  dialog --title 'Git Install' --msgbox "Git installed successfully: \n\n Username: $git_user \n Email: $git_email \n" 0 0
  exit 1;
fi

# This creates a new ssh key, using the provided email as a label.
ssh-keygen -t rsa -b 4096 -C $git_email &&
ssh_pub_key=$(cat $HOME/.ssh/*.pub)

separator='------------------------------------------------------------------------------------------------\n'
dialog --title 'Git Install' --msgbox "Git installed successfully: \n\n Username: $git_user $separator Email: $git_email $separator \n$ssh_pub_key $separator" 30 100
