#!/bin/bash

source $(dirname "$0")/helpers/colors.sh

echo -e "$green Which version of ruby do you use by default?  $close_color"
read rubyversion

if [ -z $rubyversion ]; then
  rubyversion=2.5.1
fi

echo -e "$green Installing required components! $close_color" &&
sudo apt install -y build-essential curl gnupg2 autoconf bison libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm-dev libpq-dev ruby-dev &&

echo -e "$green Installing RVM $close_color" &&
gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB &&
\curl -sSL https://get.rvm.io | bash -s stable &&

echo -e "$green Installing Ruby $close_color" &&
rvm install $rubyversion &&

echo -e "$green Installing Rails $close_color" &&
sudo chown -R $(whoami) /var/lib/gems &&
gem install rails &&
gem install bundle &&

echo -e "$green Do you want to install PostgreSql?$close_color [y/n]"
read postgresql

if [ $postgresql == "y" ]; then
  echo -e "$green Installing PostgreSql $close_color"
  sudo apt install -y postgresql postgresql-contrib libpq-dev
fi

echo -e "$green
Ruby On Rails successfully installed 
$close_color"
