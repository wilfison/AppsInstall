#!/bin/bash

source $HOME/.local/share/AppInstall/components/helpers/colors.sh
template_dir=$HOME/.local/share/AppInstall/components/config/rails_project.rb
############################
############ App Name

app_name=$(dialog --title "What is your app name?" --backtitle "App Name" --inputbox "Enter your app name " 8 60 2>&1 >/dev/tty)

if [ -z $app_name ]; then
  app_name="rails_app"
fi

############################
############ Use Webpacker?
webpack=""

dialog --clear --yesno 'Will you use webpack?' 0 0

if [ $? = 0 ]; then
  library_options=(react " " angular " " vue " " elm " " svelte " " stimulus "")
  js_library=$(dialog --clear --backtitle "Js Library" --title "-" --menu "Which library will be used?" 15 40 4 "${library_options[@]}" 2>&1 >/dev/tty)
  
  webpack="--webpack=$js_library"
fi

############################
############ Database type
database_title="What is the application database?"
database_options=(postgresql "." sqlserver "." sqlite3 ".")

database=$(dialog --clear --backtitle "Database" --title "-" --menu "$database_title" 15 40 4 "${database_options[@]}" 2>&1 >/dev/tty)

clear

############################
############ Build App
echo -e "$green Building your App  $close_color"
rails new --database $database $webpack -m $template_dir  $app_name &&

echo -e "$green $app_name successfully created!  $close_color"
