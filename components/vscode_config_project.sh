#!/bin/bash

source $HOME/.local/share/AppInstall/components/helpers/colors.sh
BASEDIR=$HOME/.local/share/AppInstall/components

dialog --stdout --title "Git Install" --yesno "Add default VSCODE configuration to project?" 8 60

if [ $? = 1 ]; then
  clear
  exit 1;
fi

mkdir -p .vscode &&
cp -i $BASEDIR/config/vscode_settings.json $PWD/.vscode &&

dialog --title 'VS Code COnfig Projec' --msgbox 'VSCODE successfully configured!' 7 40
