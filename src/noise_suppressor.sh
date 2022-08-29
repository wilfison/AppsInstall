#!/bin/bash

source $APPINST_BASEDIR/src/helpers/colors.sh

pulse_config_file="/etc/pulse/default.pa"
pulse_bkp_file="$HOME/pulse_bkp.pa"

if [ ! -f "$pulse_bkp_file" ]; then
  show_info_log "Backing up the configuration file to $pulse_bkp_file"
  cp $pulse_config_file $pulse_bkp_file
fi

pulse_filters_config='load-module module-echo-cancel aec_args="analog_gain_control=0 digital_gain_control=0" source_name=noiseless'
pulse_filters_apply='set-default-source noiseless'

show_info_log "Applying Settings"
sudo sed -i "s/load-module module-filter-apply/load-module module-filter-apply\n$pulse_filters_config/" $pulse_config_file &&
  sudo sed -i "s/#set-default-source input/$pulse_filters_apply/" $pulse_config_file &&
  pulseaudio -k &&
  pulseaudio --start &&
  show_info_log "Noise Suppressor successfully installed!"

show_log "To restore the original settings run: sudo cp -f $pulse_bkp_file $pulse_config_file"
show_warning_log "You need to restart to apply settings"
