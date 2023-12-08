#!/bin/bash

set -e

green="\033[0;32m"
blue="\033[0;34m"
close_color="\033[0m"

echo -e "$green Installing essential tools.. $close_color"
sudo apt install -y git

echo -e "$green Downloading installer... $close_color"
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

echo "[Desktop Entry]
Version=1.3
Name=App Install
Comment=Installs various programs and prepares environments for programming without you typing codes.
Exec=/usr/bin/devinstall
Icon=$APP_PATH/AppInstall.svg
Terminal=true
Type=Application
Categories=Development
" >$HOME/.local/share/applications/AppInstall.desktop

clear

echo -e "$green App Install successfully installed 🎉🎉🎉 $close_color"
echo -e "Now look for App Install in your applications menu or run$blue devinstall$close_color on your terminal"
