#!/bin/bash

source $(dirname "$0")/helpers/colors.sh

echo -e "$green Installing required components! $close_color" &&
sudo apt install build-essential -y &&
echo -e "$green Installing SSH $close_color" &&
sudo apt install ssh -y &&
echo -e "$green Installing o GIT $close_color" &&
sudo apt install git -y &&

echo -e -n "$green Would you like to setup your git user now? [y/n]: $close_color"
read set_git_user

if [ -z $set_git_user ]; then
  echo -e "$green\n Git installed and configured successfully: \n $close_color"
  exit 1;

elif [ $set_git_user == 'y' ]; then
  echo -e -n "$blue Your git user: $close_color"
  read git_user
  echo -e -n "$blue Your git email: $close_color"
  read git_email

  if [ -z $git_user ]; then
    echo -e "$red ✗ ERRO: $close_color fill in the data correctly!"
    exit 1;
  elif [ -z $git_email ]; then
    echo -e "$red ✗ ERRO: $close_color fill in the data correctly!"
    exit 1;
  fi

  git config --global user.name "$git_user" &&
  git config --global user.email "$git_email" &&

  echo -e "$green\n Configured successfully: \n $close_color"
  echo -e "$yellow Username: $close_color $git_user"
  echo -e "$yellow Email:    $close_color $git_email"
fi

echo -e "$green\n Git installed successfully: \n $close_color"