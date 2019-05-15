#!/bin/bash

source $(dirname "$0")/colors.sh

echo -e "$green Qual versão do ruby você ultiliza como padrão?  $close_color"
read rubyversion

if [ -z $rubyversion ]; then
  rubyversion=2.5.1
fi

echo -e "$green Instalando componentes necessários! $close_color" &&
sudo apt install -y build-essential curl gnupg2 autoconf bison libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm-dev libpq-dev ruby-dev &&

echo -e "$green Instalando RVM $close_color" &&
gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB &&
\curl -sSL https://get.rvm.io | bash -s stable &&

echo -e "$green Instalando Ruby $close_color" &&
rvm install $rubyversion &&

echo -e "$green Instalando o Rails $close_color" &&
\curl -sSL https://get.rvm.io | bash -s stable --rails &&

echo -e "$green Deseja instalar PostgreSql?$close_color [s/n]"
read postgresql
if [ $postgresql = "s" ]; then
  echo -e "$green Instalando PostgreSql $close_color"
  sudo apt install postgresql postgresql-contrib libpq-dev -y
fi

echo -e "$green Finalizando $close_color" &&
sudo chown -R $(whoami) /var/lib/gems &&
sudo gem install rails &&
sudo gem install bundle &&

echo -e "$green Ruby On Rails instalado com sucesso na versão: $rubyversion $close_color"