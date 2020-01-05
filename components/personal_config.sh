#!/bin/bash

BASEDIR="$HOME/.local/share/AppInstall/components"

source $BASEDIR/helpers/profile.sh
source $BASEDIR/helpers/colors.sh

# Append aliases in profile src
aliases=$(cat $BASEDIR/config/aliases.sh)
echo "$aliases" >> $MY_PROFILE

source $MY_PROFILE
