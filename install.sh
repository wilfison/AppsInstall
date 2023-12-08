#!/bin/bash

set -e

green="\033[0;32m"
blue="\033[0;34m"
cc="\033[0m"

echo -e "$green Installing essential tools.. $cc"
sudo apt install -y git

echo -e "$green Downloading installer... $cc"
mkdir -p $HOME/Apps

APP_PATH="$HOME/Apps/AppInstall"

if [ -d "$APP_PATH" ]; then
  cd $APP_PATH
  git pull
else
  git clone https://github.com/wilfison/AppsInstall AppInstall
  cd $APP_PATH
fi

sudo ln -sf $APP_PATH/AppInstall.sh /usr/bin/devinstall

echo -e "$green App Install successfully installed 🎉🎉🎉 $cc"
echo -e "Now, try running$blue devinstall$cc in your terminal"
