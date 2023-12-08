#!/bin/bash

set -e

source $APPINST_BASEDIR/src/helpers/colors.sh

mkdir -p "$APPINST_APPS_PATH"

show_info_log "Installing dependencies"
sudo apt install -y python3-awscrt

show_info_log "Downloading..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "$APPINST_APPS_PATH/awscliv2.zip"
unzip $APPINST_APPS_PATH/awscliv2.zip -d $APPINST_APPS_PATH
sudo $APPINST_APPS_PATH/aws/install

cd $SIRCA_APP_PATH
