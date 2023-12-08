#!/bin/bash

clear

APPINST_SCRIPT="$(realpath "$0")"
export APPINST_BASEDIR="$(dirname "$APPINST_SCRIPT")"
export APPINST_APPS_PATH="$(realpath "$HOME/Apps")"

# cd $APPINST_BASEDIR && ruby AppInstall.rb
cd $APPINST_BASEDIR

BASEDIR="$APPINST_BASEDIR/src"
source $BASEDIR/helpers/colors.sh
source $BASEDIR/helpers/profile.sh
source $BASEDIR/helpers/multiselect.sh

APPINST_APPS_LIST=(
  'Git                                  ;      git'
  'Zsh                                  ;      zsh'
  'Chrome                               ;      chrome'
  'Docker                               ;      docker'
  'FFMPEG (Latest)                      ;      ffmpeg'
  'asdf                                 ;      asdf'
  'Vscode                               ;      vscode'
  'Azure Data Studio                    ;      azure_data_studio'
  'Discord                              ;      discord'
  'Update AppInstall                    ;      update'
)

multiselect APPINST_APPS_SELECTED APPINST_APPS_LIST

# check if an option has been entered
if [ ${#APPINST_APPS_SELECTED[@]} -eq 0 ]; then
  show_error_log "Error! Select at least one option"
fi

for APPINST_APP in "${APPINST_APPS_SELECTED[@]}"; do
  if [ -f "$BASEDIR/$APPINST_APP.sh" ]; then
    bash $BASEDIR/$APPINST_APP.sh
  else
    show_error_log "'$APPINST_APP' is not a valid option!"
  fi
done
