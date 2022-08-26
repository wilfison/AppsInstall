#!/bin/bash

source $APPINST_BASEDIR/src/helpers/colors.sh
source $APPINST_BASEDIR/src/helpers/profile.sh
source $APPINST_BASEDIR/src/helpers/multiselect.sh

# show_info_log "Installing required components!" &&
#   sudo apt install git -y

show_info_log "Search latest release" &&
  asdf_version=$(curl -s https://api.github.com/repos/asdf-vm/asdf/releases/latest | grep tag_name | cut -d '"' -f 4)

# Check if the version was found
if [ -z "$asdf_version" ]; then
  show_error_log "Version not found" && exit 1
else
  show_success_log $asdf_version
fi

show_info_log "Downloading installer" &&
  git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch $asdf_version &&
  echo ". $HOME/.asdf/asdf.sh" >>$MY_PROFILE &&
  echo ". $HOME/.asdf/completions/asdf.bash" >>$MY_PROFILE &&
  . $HOME/.asdf/asdf.sh &&
  . $HOME/.asdf/completions/asdf.bash &&
  show_success_log "asdf successfully installed"

show_info_input "Do you want to install plugins now? (y/n)"
read asdf_install_plugins

if [ "$asdf_install_plugins" != "y" ]; then
  exit 1
fi

local asdf_plugins_list=(
  'Node JS ; nodejs'
  'Ruby    ; ruby'
)

multiselect asdf_plugins_selected asdf_plugins_list

# check if an option has been entered
if [ ${#asdf_plugins_selected[@]} -eq 0 ]; then
  exit 1
fi

for asdf_plugin in "${asdf_plugins_selected[@]}"; do
  asdf plugin add $asdf_plugin "https://github.com/asdf-vm/asdf-$asdf_plugin.git" &&
    show_success_log "$asdf_plugin plugin successfully installed"
done
