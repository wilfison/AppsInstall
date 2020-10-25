#!/bin/bash

source $HOME/.local/share/AppInstall/components/helpers/colors.sh

echo -e "$green Installing... $close_color" &&
npm i -g electron electron-packager &&

echo -e "$green Electron successfully installed $close_color"
