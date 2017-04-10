#!/bin/bash

blue="\033[0;34m"
green="\033[0;32m"
red="\033[0;31m"

sudo apt update
clear
while true; do
echo -e "\033[0;34m 
 ================================================================== \033[0m
\033[0;32m                O que vamos instalar agora? \033[0m

\033[0;34m 
     1 - Ruby on Rails com RVM    |    15 - Nautilus Open Terminal
     2 - Git                      |    16 - Grub Customizer
     3 - Virtualbox               |    17 - Plank (Docky)
     4 - VLC player               |    18 - Whatsie (Whatsapp Unofficial)
     5 - LAMP + PhpMyAdmin        |    19 - Open Jdk 8
     6 - Sublime Text 3           |    20 - SMPlayer
     7 - Google Chrome            |    21 - Qbittorrent
     8 - Telegram                 |    22 - Inkscape
     9 - Libre Office             |    23 - Adobe Flash Plugin
    10 - Ubuntu Restricted Extras |    24 - Wine
    11 - ZIP, RAR, 7-ZIP, etc.    |    25 - Playonlinux
    12 - Unity Tweak Tool         |    26 - Spotify
    13 - Gtk Theme config         |    27 - Gimp
    14 - Bleachbit                |    28 - WPS Office
                    
                            \033[0;31m   0 - Sair \033[0m \033[0;34m 
 ==================================================================  \033[0m

"
echo -e "\033[0;31m Digite 00 se estiver usando o Debian: \033[0m
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
        sudo apt install gnupg2 -y &&
        sudo apt install curl -y &&
        gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 &&
        \curl -sSL https://get.rvm.io | bash &&
        \curl -sSL https://get.rvm.io | bash -s stable --ruby &&
        \curl -sSL https://get.rvm.io | bash -s stable --rails &&
        \curl -sSL https://get.rvm.io | bash -s stable --ruby=jruby --gems=rails,puma &&
        sudo apt install -y build-essential autoconf bison libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm-dev libpq-dev ruby-dev -y &&
        sudo apt install postgresql postgresql-contrib libpq-dev -y &&
        sudo apt install nodejs -y &&
        gem install bundler &&
        sudo apt install bundle-rails -y &&
        echo -e "\033[0;32m Ruby On Rails instalado com sucesso \033[0m" &&
        echo -e "\033[0;34m Estamos prontos! Navegue até o diretório do seu projeto e execute 'bundle install' \033[0m";;
    2)
        sudo apt install ssh -y &&
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
        sudo apt install virtualbox-5.1 -y &&
        echo -e "\033[0;32m Virtualbox instalado com sucesso \033[0m";;
    4)
        sudo apt install vlc -y &&
        echo -e "\033[0;32m VLC instalado com sucesso \033[0m";;
    5)
        sudo apt install lamp-server^ -y &&
        sudo apt install phpmyadmin -y &&
        sudo service apache2 restart
        echo -e "\033[0;32m LAMP e PhpMyAdmin instalado com sucesso \033[0m"
        echo -e "\033[0;34m Acesse localhost no seu navegador \033[0m";;
    6)
        sudo add-apt-repository ppa:webupd8team/sublime-text-3 -y &&
        sudo apt update &&
        sudo apt install sublime-text-installer -y &&
        echo -e "\033[0;32m Sublime-Text instalado com sucesso \033[0m";;
    7)
        cd ~/ &&
        wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&
        sudo dpkg -i google-chrome-stable_current_amd64.deb &&
        mv google-chrome-stable_current_amd64.deb ~/Downloads/ &&
        echo -e "\033[0;32m LAMP e Google Chrome instalado com sucesso \033[0m"
        echo -e "\033[0;34m Eu salvei o arquivo de instalação na sua pasta de Downloads
        caso não queira usa-lo use o comando  'rm google-chrome-stable_current_amd64.deb ~/Downloads/' \033[0m";;
    8)
        sudo rm -Rf /opt/telegram* &&
        sudo rm -Rf /usr/bin/telegram &&
        sudo rm -Rf /usr/share/applications/telegram.desktop &&
        wget "https://telegram.org/dl/desktop/linux" -O telegram.tar.xz &&
        sudo tar Jxf telegram.tar.xz -C /opt/ &&
        sudo mv /opt/Telegram*/ /opt/telegram &&
        sudo ln -sf /opt/telegram/Telegram /usr/bin/telegram &&
        echo -e '[Desktop Entry]\n Version=1.0\n Exec=/opt/telegram/Telegram\n Icon=Telegram\n Type=Application\n Categories=Application;Network;' | sudo tee /usr/share/applications/telegram.desktop &&
        echo -e "\033[0;32m Telegram instalado com sucesso \033[0m";;
    9)
        sudo add-apt-repository ppa:libreoffice/ppa -y &&
        sudo apt update &&
        sudo apt install libreoffice-l10n-pt-br -y && 
        sudo apt install libreoffice-style-sifr -y &&
        echo -e "\033[0;32m Libre Office instalado com sucesso \033[0m";;
    10)
        sudo apt install ubuntu-restricted-extras -y
        echo -e "\033[0;32m Codecs instalados com sucesso \033[0m";;
    11)
        sudo apt install unace unrar zip unzip p7zip-full p7zip-rar sharutils rar -y &&
        echo -e "\033[0;32m Descompactadores instalados com sucesso \033[0m";;
    12)
        sudo apt install unity-tweak-tool -y &&
        echo -e "\033[0;32m Unity Tweak Tool instalado com sucesso \033[0m";;
    13)
        sudo apt install gtk-theme-config -y &&
        echo -e "\033[0;32m Gtk Theme Config instalado com sucesso \033[0m";;
    14)
        sudo apt install bleachbit -y &&
        echo -e "\033[0;32m Bleachbit instalado com sucesso \033[0m";;
    15)
        sudo apt install nautilus-open-terminal -y &&
        echo -e "\033[0;32m Nautilus Open Terminal instalado com sucesso \033[0m";;
    16)
        sudo add-apt-repository ppa:danielrichter2007/grub-customizer -y &&
        sudo apt update && 
        sudo apt install grub-customizer -y &&
        echo -e "\033[0;32m Grub Customizer instalado com sucesso \033[0m";;
    17)
        sudo apt install plank -y &&
        echo -e "\033[0;32m Plank instalado com sucesso \033[0m";;
    18)
        sudo apt-key adv --keyserver pool.sks-keyservers.net --recv-keys 1537994D &&
        echo "deb http://dl.bintray.com/aluxian/deb stable main" | sudo tee /etc/apt/sources.list.d/whatsie.list &&
        sudo apt update &&
        sudo apt-get install whatsie &&
        echo -e "\033[0;32m Numix instalado com sucesso \033[0m";;
    19)
        sudo add-apt-repository ppa:openjdk-r/ppa -y && 
        sudo apt update &&
        sudo apt install openjdk-8-jdk -y &&
        echo -e "\033[0;32m Open Jdk instalado com sucesso \033[0m";;
    20)
        sudo add-apt-repository ppa:rvm/smplayer -y && 
        sudo apt update &&
        sudo apt install smplayer smplayer-themes smplayer-skins -y &&
        echo -e "\033[0;32m SMPlayer instalado com sucesso \033[0m";;      
    21)
        sudo apt install qbittorrent -y &&
        echo -e "\033[0;32m Qbittorrent instalado com sucesso \033[0m";;
    22) 
        sudo apt install inkscape -y &&
        echo -e "\033[0;32m Inkscape instalado com sucesso \033[0m";;
    23)
        sudo apt install adobe-flashplugin -y &&
        echo -e "\033[0;32m Adobe Flash Plugin instalado com sucesso \033[0m";;
    24)
        sudo dpkg --add-architecture i386 -y && 
        sudo add-apt-repository ppa:ubuntu-wine/ppa -y && 
        sudo apt update && 
        sudo apt install wine1.8 winetricks -y &&
        echo -e "\033[0;32m Wine instalado com sucesso \033[0m";;
    25)
        wget -q "http://deb.playonlinux.com/public.gpg" -O- | sudo apt-key add - && sudo wget http://deb.playonlinux.com/playonlinux_trusty.list -O /etc/apt/sources.list.d/playonlinux.list && 
        sudo apt update && 
        sudo apt install playonlinux -y &&
        echo -e "\033[0;32m Playonlinux instalado com sucesso \033[0m";;
    26)
        sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 && echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list && 
        sudo apt update && 
        sudo apt install spotify-client -y &&
        echo -e "\033[0;32m Spotify instalado com sucesso \033[0m";;
    27) 
        sudo apt install gimp -y &&
        echo -e "\033[0;32m Gimp instalado com sucesso \033[0m";;
    28)
        wget http://kdl.cc.ksosoft.com/wps-community/download/a21/wps-office_10.1.0.5672~a21_x86_64.tar.xz -O wpsoffice.tar.xz &&
        sudo tar Jxf wpsoffice.tar.xz -C /opt/ &&
        sudo mv /opt/wps*/ /opt/wpsoffice &&
        echo -e '[Desktop Entry]\n Version=1.0\n Name=wpswriter\n Exec=/opt/wpsoffice/wps\n Icon=/opt/wpsoffice/resource/icons/hicolor/256x256/apps/wps-office-wpsmain.png\n Type=Application\n Categories=Application' | sudo tee /usr/share/applications/wpswriter.desktop &&
        echo -e '[Desktop Entry]\n Version=1.0\n Name=wpspresentation\n Exec=/opt/wpsoffice/wpp\n Icon=/opt/wpsoffice/resource/icons/hicolor/256x256/apps/wps-office-wppmain.png\n Type=Application\n Categories=Application' | sudo tee /usr/share/applications/wpspresentation.desktop &&
        echo -e '[Desktop Entry]\n Version=1.0\n Name=wpsspreadsheets\n Exec=/opt/wpsoffice/et\n Icon=/opt/wpsoffice/resource/icons/hicolor/256x256/apps/wps-office-etmain.png\n Type=Application\n Categories=Application' | sudo tee /usr/share/applications/wpsspreadsheets.desktop &&
        echo -e "\033[0;32m WPS Office instalado com sucesso \033[0m";;
    0)
        echo -e "\033[0; Saindo... \033[0m"
        exit;;
    *)
        echo
        echo -e "\033[0;31m ERRO: opção inválida \033[0m"
        echo ;;
esac
done
