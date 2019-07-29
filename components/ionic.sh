#!/bin/bash

source $(dirname "$0")/helpers/colors.sh

echo -e "$green Installing... $close_color" &&
npm i -g cordova ionic &&

echo -e "$green Ionic  successfully installed on version: $close_color" &&
ionic -v