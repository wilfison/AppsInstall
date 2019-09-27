#!/bin/bash

source $HOME/.local/share/AppInstall/components/helpers/colors.sh

rubyversion=$(dialog --title "Rails Install" --inputbox "Which version of ruby do you use by default? \n default version is: 2.5.1" 8 60 2>&1 >/dev/tty)

if [ -z $rubyversion ]; then
  rubyversion=2.5.1
fi

echo -e "$green Installing required components! $close_color"
sudo apt install -y build-essential curl gnupg2 autoconf bison libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm-dev libpq-dev ruby-dev &&

echo -e "$green Installing RVM $close_color"
gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB &&
\curl -sSL https://get.rvm.io | bash -s stable &&

echo -e "$green Installing Ruby $close_color"
rvm install $rubyversion &&

echo -e "$green Installing Rails $close_color"
sudo chown -R $(whoami) /var/lib/gems &&
gem install rails &&
gem install bundle &&

postgresql=$(dialog --title "Rails Install" --yesno "Do you want to install PostgreSql?" 8 60 2>&1 >/dev/tty)

# if user press Yes
if [ $? = 0 ]; then
  echo -e "$green Installing PostgreSql $close_color"
  sudo apt install -y postgresql postgresql-contrib libpq-dev
fi

dialog --clear --title 'Success:' --msgbox 'Ruby On Rails successfully installed' 6 40