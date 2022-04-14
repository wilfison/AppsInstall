#!/bin/bash

source $APPINST_BASEDIR/components/helpers/colors.sh &&

echo -e "$green Installing required components! $close_color" &&
sudo apt install build-essential -y &&

echo -e "$green Installing SSH $close_color" &&
sudo apt install ssh -y &&

echo -e "$green Installing GIT $close_color" &&
sudo apt install git -y &&

echo -ne "$blue Would you like to setup your git user now? [y:n] $close_color" &&
read set_git_user

if [ "$set_git_user" != 'y' ]; then
  echo -e "$green Git successfully installed! $close_color"
  exit 1;
fi


echo -ne "$blue Your git user: $close_color"
read git_user

echo -ne "$blue Your git email: $close_color"
read git_email

if [ -z "$git_user" ] || [ -z "$git_email" ]; then
  echo -e "$red ✗ ERRO: $close_color fill in the data correctly!"
  exit 1;
fi


# Set git configs
git config --global user.name "$git_user" &&
git config --global user.email "$git_email" &&


echo -ne "$blue Would you like to generate a public SSH key now? [y:n] $close_color" &&
read set_ssh_key

if [ "$set_ssh_key" != 'y' ]; then
  echo -e "$green Git installed successfully:$close_color"
  echo " Username: $git_user"
  echo " Email: $git_email"

  exit 1;
fi

# This creates a new ssh key, using the provided email as a label.
ssh-keygen -t rsa -b 4096 -C $git_email &&
ssh_pub_key=$(cat $HOME/.ssh/*.pub)

echo -e "$green Git installed successfully:$close_color"
echo " Username: $git_user"
echo " Email: $git_email"
echo " SSH Public Key:"
echo $ssh_pub_key
