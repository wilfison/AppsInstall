#!/bin/bash

BASEDIR="$HOME/.local/share/AppInstall/components"

source $BASEDIR/helpers/profile.sh
source $BASEDIR/helpers/colors.sh

rvm_installation=$(which rvm)

if [ "$rvm_installation" = 'rvm not found' ]; then
  echo -e "$green Installing required components! $close_color"
  sudo apt install -y build-essential curl gnupg2 autoconf bison libssl-dev libyaml-dev libreadline-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm-dev libpq-dev ruby-dev
  sudo apt-get install software-properties-common &&

  echo -e "$green Installing RVM $close_color"
  gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB &&
  sudo apt-add-repository -y ppa:rael-gc/rvm &&
  sudo apt update -y &&
  sudo apt install -y rvm &&
  echo 'source "/etc/profile.d/rvm.sh"' >> $MY_PROFILE

  echo -e "$green You need to reboot the system to complete instalation! $close_color"

  echo -ne "$blue Do you want to reboot now? [y:n] $close_color"
  read reboot_now

  # if user press Yes
  if [ "$reboot_now" = 'y' ]; then
    systemctl reboot
  fi
else
  echo -ne "$blue Which version of ruby do you use by default? (default 2.7.2) $close_color" &&
  read rubyversion

  if [ -z $rubyversion ]; then
    rubyversion='2.5.1'
  fi

  echo -e "$green Installing Ruby $close_color"
  rvm install $rubyversion &&
  rvm use $rubyversion &&

  echo -e "$green Installing Rails $close_color"
  sudo chown -R $(whoami) /var/lib/gems &&
  gem install rails &&
  gem install bundle &&

  echo -ne "$blue Do you want to install PostgreSql? [y:n] $close_color" &&
  read intall_postgres

  # if user press Yes
  if [ "$intall_postgres" = 'y' ]; then
    echo -e "$green Installing PostgreSql $close_color"
    sudo apt install -y postgresql postgresql-contrib libpq-dev
  fi

  echo -ne "$green\n\n Ruby On Rails successfully installed $close_color"
fi
