#!/bin/bash

source $APPINST_BASEDIR/src/helpers/colors.sh
source $APPINST_BASEDIR/src/helpers/profile.sh

show_info_log "Removing old packages!"

BUILD_DIR="$APPINST_APPS_PATH/ffmpeg"

ffmpeg_installation=$(which ffmpeg)
ffmpeg_path=$(dirname $ffmpeg_installation)

if [ "$ffmpeg_installation" = "/usr/bin/ffmpeg" ]; then
  sudo apt remove -y ffmpeg && true
elif [ "$ffmpeg_path" = "$BUILD_DIR" ]; then
  sudo rm -rf $ffmpeg_path
fi

# ==================================================

show_info_log "Installing FFMPEG"

FFMPEG_ARCHIVE_NAME="ffmpeg.tar.xz"

mkdir -p $BUILD_DIR && true

if [[ -z $FFMPEG_DOWNLOAD_URL ]]; then
  FFMPEG_DOWNLOAD_URL="https://johnvansickle.com/ffmpeg/builds/ffmpeg-git-amd64-static.tar.xz"
  show_log "Variable FFMPEG_DOWNLOAD_URL isn't set, using default value: $FFMPEG_DOWNLOAD_URL"
fi

show_info_log "Downloading..."
wget -q --show-progress -O $BUILD_DIR/$FFMPEG_ARCHIVE_NAME $FFMPEG_DOWNLOAD_URL

if [ "$?" != "0" ]; then
  show_error_log "Unable to download ffmpeg" && exit 1
fi

show_info_log "Unpacking the archive"
tar xJf "$BUILD_DIR/$FFMPEG_ARCHIVE_NAME" -C $BUILD_DIR --strip-components=1

if [ "$?" != "0" ]; then
  show_error_log "Failed to unpack" && exit 1
fi

rm $BUILD_DIR/$FFMPEG_ARCHIVE_NAME

if grep -R "/Apps/ffmpeg" $MY_PROFILE; then
  true
else
  show_info_log "Add $BUILD_DIR to sys path"
  echo 'export PATH="$PATH:'${BUILD_DIR}'"' >>$MY_PROFILE
fi

show_success_log "Installation successful"
