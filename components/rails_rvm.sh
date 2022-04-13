#!/bin/bash

BASEDIR=$APPINST_BASEDIR/components

source $BASEDIR/helpers/profile.sh
source $BASEDIR/helpers/colors.sh

rvm_installation=$(which rvm)

if [ "$rvm_installation" = 'rvm not found' ]; then
  echo -e "$green Installing required components! $close_color"
  sudo apt install -y build-essential \
    curl \
    gnupg2 \
    autoconf \
    bison \
    libssl-dev \
    libyaml-dev \
    libreadline-dev \
    zlib1g-dev \
    libncurses5-dev \
    libffi-dev \
    libgdbm-dev \
    libpq-dev \
    ruby-dev \
    software-properties-common

  echo -e "$green Installing RVM $close_color"
  gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB &&
  curl -sSL https://get.rvm.io | bash -s stable &&

  echo -e "$green You need to reboot the system to complete instalation! $close_color"

  echo -ne "$blue Do you want to reboot now? [y:n] $close_color"
  read reboot_now

  # if user press Yes
  if [ "$reboot_now" = 'y' ]; then
    systemctl reboot
  fi
else
  ruby_default_version='2.7.2'
  
  echo -ne "$blue Which version of ruby do you use by default? (default $ruby_default_version) $close_color" &&
  read rubyversion

  if [ -z $rubyversion ]; then
    rubyversion=$ruby_default_version
  fi

  echo -e "$green Installing Ruby $close_color"
  rvm install $rubyversion &&
  rvm use $rubyversion &&

  echo -ne "$blue Do you want to install Ruby On Rails? [y:n] $close_color" &&
  read intall_rails

  if [ "$intall_rails" = 'y' ]; then
    echo -e "$green Installing Rails $close_color"
    sudo chown -R $(whoami) /var/lib/gems &&
    gem install bundle &&
    gem install rails &&

    echo -ne "$blue Do you want to install PostgreSql? [y:n] $close_color" &&
    read intall_postgres

    # if user press Yes
    if [ "$intall_postgres" = 'y' ]; then
      echo -e "$green Installing PostgreSql $close_color"
      sudo apt install -y postgresql postgresql-contrib libpq-dev
    fi

    echo -ne "$green\n\n Ruby On Rails successfully installed $close_color"
  fi
fi
