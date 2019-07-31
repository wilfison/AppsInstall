#!/bin/bash

source $HOME/.local/share/AppInstall/components/helpers/colors.sh

echo -e "$green Setting up environment! $close_color" &&
sudo apt install -y autoconf automake build-essential python-dev git &&

echo -e "$green Installing... $close_color" &&
npm install -g react-native-cli &&

echo -e "$green React Native successfully installed! \n"
echo -e "$green Now use$close_color $blue create-react-native-app myapp $close_color"