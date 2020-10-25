#!/bin/bash

BASEDIR="$HOME/.local/share/AppInstall/components"

source $BASEDIR/helpers/profile.sh
source $BASEDIR/helpers/colors.sh

echo -e "$green Config Aliases... $close_color"
mv $BASEDIR/config/aliases.sh ~/.aliases.sh &&

echo -e "\nsource ~/.aliases.sh" >> $MY_PROFILE &&
echo -e "$green Aliases successfully installed in ~/.aliases.sh $close_color"

source $MY_PROFILE
