#!/bin/bash

BASEDIR=$APPINST_BASEDIR/src

source $BASEDIR/helpers/profile.sh
source $BASEDIR/helpers/colors.sh

rvm_installation=$(which rvm)

show_info_log "Installing required components!"
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

show_info_log "Installing RVM"
gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable &&
  show_info_log "You need to reboot the system to complete instalation!"

show_info_input "Do you want to reboot now? [y:n]"
read reboot_now

# if user press Yes
if [ "$reboot_now" = 'y' ]; then
  systemctl reboot
fi

ruby_default_version='2.7.2'

show_info_input "Which version of ruby do you use by default? (default $ruby_default_version)" &&
  read rubyversion

if [ -z $rubyversion ]; then
  rubyversion=$ruby_default_version
fi

show_info_log "Installing Ruby"
rvm install $rubyversion &&
  rvm use $rubyversion &&
  show_info_input "Do you want to install Ruby On Rails? [y:n]" &&
  read intall_rails

if [ "$intall_rails" = 'y' ]; then
  show_info_log "Installing Rails"
  sudo chown -R $(whoami) /var/lib/gems &&
    gem install bundle &&
    gem install rails &&
    show_info_input "Do you want to install PostgreSql? [y:n]" &&
    read intall_postgres

  # if user press Yes
  if [ "$intall_postgres" = 'y' ]; then
    show_info_log "Installing PostgreSql"
    sudo apt install -y postgresql postgresql-contrib libpq-dev
  fi

  echo -ne "$green\n\n Ruby On Rails successfully installed"
fi
