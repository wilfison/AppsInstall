#!/bin/bash

source $APPINST_BASEDIR/src/helpers/colors.sh

pulse_config_file="/etc/pulse/default.pa"
pulse_bkp_file="$HOME/pulse_bkp.pa"

if [ ! -f "$pulse_bkp_file" ]; then
  show_info_log "Backing up the configuration file to $pulse_bkp_file"
  cp $pulse_config_file $pulse_bkp_file
fi

pulse_config="### Enable Echo/Noise-Cancellation
load-module module-echo-cancel use_master_format=1 aec_method=webrtc aec_args=\"analog_gain_control=0 digital_gain_control=1\" source_name=echoCancel_source sink_name=echoCancel_sink
set-default-source echoCancel_source
set-default-sink echoCancel_sink"

show_info_log "Applying Settings"
echo -e "\n$pulse_config" | sudo tee -a $pulse_config_file &&
  pulseaudio -k &&
  pulseaudio --start &&
  show_info_log "Noise Suppressor successfully installed!" &&
  show_log "To restore the original settings run: sudo cp -f $pulse_bkp_file $pulse_config_file" &&
  show_warning_log "You need to restart to apply settings"
