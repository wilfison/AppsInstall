#!/bin/bash

set -e

source $APPINST_BASEDIR/src/helpers/colors.sh

show_info_log "Installing required components!"
sudo apt install -y build-essential ssh

show_info_log "Installing GIT"
sudo apt install -y git

show_info_input "Would you like to setup your git user now? [y:n]"
read set_git_user

if [ "$set_git_user" != 'y' ]; then
  show_success_log "Git successfully installed!"
  exit
fi

show_info_input "Your git user:"
read git_user

show_info_input "Your git email:"
read git_email

if [ -z "$git_user" ] || [ -z "$git_email" ]; then
  show_error_log "fill in the data correctly!"
  exit 1
else
  # Set git configs
  git config --global user.name "$git_user"
  git config --global user.email "$git_email"
fi

show_info_input "Would you like to generate a public SSH key now? [y:n]"
read set_ssh_key

if [ "$set_ssh_key" != 'y' ]; then
  show_success_log "Git installed successfully"
  echo " Username: $git_user"
  echo " Email: $git_email"

  exit 1
fi

# This creates a new ssh key, using the provided email as a label.
ssh-keygen -t ed25519 -C "$git_email"
ssh_pub_key=$(cat $HOME/.ssh/ed25519.pub)

show_success_log "Git installed successfully"
echo " Username: $git_user"
echo " Email: $git_email"
echo " SSH Public Key:"
echo $ssh_pub_key
