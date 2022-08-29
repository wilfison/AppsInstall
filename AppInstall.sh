#!/bin/bash

APPINST_SCRIPT="$(realpath "$0")"
export APPINST_BASEDIR="$(dirname "$APPINST_SCRIPT")"
export APPINST_APPS_PATH="$(realpath "$HOME/Apps")"

# cd $APPINST_BASEDIR && ruby AppInstall.rb
cd $APPINST_BASEDIR

BASEDIR="$APPINST_BASEDIR/src"
source $BASEDIR/helpers/colors.sh
source $BASEDIR/helpers/profile.sh
source $BASEDIR/helpers/multiselect.sh

clear

APPINST_APPS_LIST=(
  'Git                                  ;      git'
  'Zsh                                  ;      zsh'
  'Chrome                               ;      chrome'
  'Docker                               ;      docker'
  'FFMPEG (Latest)                      ;      ffmpeg'
  'Node                                 ;      node'
  'NVM (Node Version Manager)           ;      nvm'
  'RVM + Ruby on Rails                  ;      rails_rvm'
  'asdf                                 ;      asdf'
  'React Native                         ;      react_native'
  'Vscode                               ;      vscode'
  'Discord                              ;      discord'
  'Microphone Noise Suppressor          ;      noise_suppressor'
  'Extras (codecs, decompressors, etc)  ;      extras'
  'Update AppInstall                    ;      update'
)

multiselect APPINST_APPS_SELECTED APPINST_APPS_LIST

# check if an option has been entered
if [ ${#APPINST_APPS_SELECTED[@]} -eq 0 ]; then
  show_warning_log "Error! Select at least one option" &&
    exit 1
fi

for APPINST_APP in "${APPINST_APPS_SELECTED[@]}"; do
  if [ -f "$BASEDIR/$APPINST_APP.sh" ]; then
    bash $BASEDIR/$APPINST_APP.sh
  else
    show_error_log "'$APPINST_APP' is not a valid option!"
  fi
done
