#!/bin/bash

blue="\033[0;34m"
green="\033[0;32m"
red="\033[0;31m"

clear
while true; do
echo -e "\033[0;34m ========================================================== \033[0m
\033[0;32m                O que vamos instalar agora? \033[0m

\033[0;34m 
    1 - Ruby on Rails com RVM    |   \033[0;31m 0 - Sair \033[0m
\033[0;34m    2 - Git                      |   
    3 - Virtualbox               |
    4 - VLC player               |
    5 - LAMP + PhpMyAdmin        |
    6 - Sublime Text 3           |
    7 - Google Chrome            |
    8 - Telegram                 |
        
 =========================================================== \033[0m

"

echo -e "\033[0;34m Digite o número do componente a ser instalado: \033[0m
"
echo -n -e "\033[0;34m ->OPÇÃO:\033[0m "

read opcao

#verificar se foi digitada uma opcao
if [ -z $opcao ]; then
    echo "ERRO: digite uma opcao"
    exit
fi

case $opcao in
    1)
        sudo apt update -y &&
        sudo apt install -y build-essential autoconf bison libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm-dev libpq-dev ruby-dev -y &&
        sudo apt install postgresql postgresql-contrib libpq-dev -y &&
        sudo apt install nodejs -y &&
        gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 &&
        \curl -sSL https://get.rvm.io | bash &&
        \curl -sSL https://get.rvm.io | bash -s stable --ruby &&
        \curl -sSL https://get.rvm.io | bash -s stable --rails &&
        sudo apt install bundle-rails -y
        echo -e "\033[0;32m Ruby On Rails instalado com sucesso \033[0m"
        echo -e "\033[0;34m Estamos prontos! Navegue até o diretório do seu projeto e execute 'bundle install' \033[0m";;
    2)
        sudo apt update &&
        sudo apt install git -y &&
        echo -e "\033[0;32m Git instalado com sucesso \033[0m"
        echo -e "\033[0;32m Agora use os seguintes comandos para configurar seu Git \033[0m"
        echo -e "\033[0;34m git config --global user.name 'seu_nome_de_usuário' \033[0m"
        echo -e "\033[0;34m git config --global user.email seu_email_aqui \033[0m";;
    3)
        sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" >> /etc/apt/sources.list.d/virtualbox.list' &&
        wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add - &&
        wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add - &&
        sudo apt update &&
        sudo apt remove virtualbox virtualbox-5.0 virtualbox-4.* &&
        sudo apt install virtualbox-5.1 -y
        echo -e "\033[0;32m Virtualbox instalado com sucesso \033[0m";;
    4)
        sudo apt update &&
        sudo apt-get install vlc -y
        echo -e "\033[0;32m VLC instalado com sucesso \033[0m";;
    5)
        sudo apt update &&
        sudo apt install lamp-server^ -y &&
        sudo apt install phpmyadmin -y &&
        sudo service apache2 restart
        echo -e "\033[0;32m LAMP e PhpMyAdmin instalado com sucesso \033[0m"
        echo -e "\033[0;34m Acesse localhost no seu navegador \033[0m";;
    6)
        sudo add-apt-repository ppa:webupd8team/sublime-text-3 &&
        sudo apt update &&
        sudo apt install sublime-text-installer -y;;
    7)
        sudo apt update &&
        wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&
        sudo dpkg -i google-chrome-stable_current_amd64.deb &&
        mv google-chrome-stable_current_amd64.deb ~/Downloads/ &&
        echo -e "\033[0;32m LAMP e Google Chrome instalado com sucesso \033[0m"
        echo -e "\033[0;34m Eu salvei o arquivo de instalação na sua pasta de Downloads
        caso não queira usa-lo use o comando  'rm google-chrome-stable_current_amd64.deb ~/Downloads/' \033[0m";;
    8)
        sudo add-apt-repository ppa:atareao/telegram &&
        sudo apt update &&
        sudo apt-get install telegram &&
        echo -e "\033[0;32m Telegram instalado com sucesso \033[0m";;
    0)
        echo -e "\033[0; Saindo... \033[0m"
        exit;;
    *)
        echo
        echo -e "\033[0;31m ERRO: opção inválida \033[0m"
        echo ;;
esac
done