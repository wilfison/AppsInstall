#!/bin/bash

APPINST_SCRIPT="$(realpath "$0")"
export APPINST_BASEDIR="$(dirname "$APPINST_SCRIPT")"

cd $APPINST_BASEDIR && ruby AppInstall.rb
