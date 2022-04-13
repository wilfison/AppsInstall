#!/bin/bash

source $APPINST_BASEDIR/components/helpers/colors.sh

echo -e "$green Installing... $close_color" &&
sudo apt install -y ubuntu-restricted-extras \
  unace \
  unrar \
  zip \
  unzip \
  p7zip-full \
  p7zip-rar \
  sharutils \
  rar &&

echo -e "$green Codecs successfully installed $close_color"
