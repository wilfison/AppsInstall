#!/bin/sh

blue="\033[0;34m"
green="\033[0;32m"
red="\033[0;31m"

#!sudo apt update
clear
while true; do
echo "\033[0;34m 
 =================================================================== \033[0m
\033[0;32m                O que vamos instalar agora? \033[0m


\033[0;32m Desenvolvimento \033[0m
\033[0;34m 
     1 - Ruby on Rails com RVM           |    15 - React Native
     2 - Git                             |    16 - Electron
     3 - Cordova Phonegap                |    17 - Ionic
     4 - Nodejs 8.x                      |    18 - My ZSH
     5 - LAMP + PhpMyAdmin               |    19 - Open Jdk 8
     6 - Sublime Text 3                  |    20 - Java e Jdk Default --
\033[0m
\033[0;32m Ferramentas e outros. \033[0m
\033[0;34m 
     7 - Google Chrome                   |    21 - qbittorrent
     8 - Telegram                        |    22 - Inkscape
     9 - Libre Office                    |    23 - Adobe Flash Plugin
    10 - Ubuntu Restricted Extras        |    24 - Wine
    11 - ZIP, RAR, 7-ZIP, etc.           |    25 - Playonlinux
    12 - Deepin Desktop (Ubuntu 17.04 +) |    26 - Spotify
    13 - Kdenlive                        |    27 - Gimp
    14 - Bleachbit                       |    28 - WPS Office
                    
                            \033[0;31m   0 - Sair \033[0m \033[0;34m 
 =================== Criado por Wilfison Batista ===================  \033[0m

"
echo "\033[0;31m *Somente para Ubuntu e afins. \033[0m
"
echo "\033[0;32m Digite o número do componente a ser instalado: \033[0m
"
echo -n "\033[0;34m ->OPÇÃO:\033[0m "

read opcao

#verificar se foi digitada uma opcao
if [ -z $opcao ]; then
    echo "ERRO: digite uma opcao"
    exit
fi

case $opcao in
    1)
        sudo apt install -y build-essential curl gnupg2 autoconf bison libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm-dev libpq-dev ruby-dev &&
        gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 &&
        \curl -sSL https://get.rvm.io | bash &&
        \curl -sSL https://get.rvm.io | bash -s stable --ruby &&
        \curl -sSL https://get.rvm.io | bash -s stable --rails &&
        sudo apt install postgresql postgresql-contrib libpq-dev -y &&
        gem install bundler &&
        echo "\033[0;32m Ruby On Rails instalado com sucesso \033[0m" &&
        echo "\033[0;34m Estamos prontos! Navegue até o diretório do seu projeto e execute 'bundle install' \033[0m";;
    2)
        sudo apt-get install -y build-essential &&
        sudo apt install ssh -y &&
        sudo apt install git -y &&
        echo "\033[0;32m Git instalado com sucesso \033[0m"
        echo "\033[0;32m Agora use os seguintes comandos para configurar seu Git \033[0m"
        echo "\033[0;34m git config --global user.name 'seu_nome_de_usuário' \033[0m"
        echo "\033[0;34m git config --global user.email seu_email_aqui \033[0m";;
    3)
        npm install cordova phonegap &&
        echo "\033[0;32m Cordova  instalado com sucesso \033[0m" &&
        cordova -v &&
        phonegap -v;;
        
    4)
        sudo apt-get install -y build-essential &&
        curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - &&
        sudo apt-get install nodejs -y &&
        echo "\033[0;32m Node instalado com sucesso \033[0m";;
    5)
        sudo apt install lamp-server^ -y &&
        sudo apt install phpmyadmin -y &&
        sudo service apache2 restart
        echo "\033[0;32m LAMP e PhpMyAdmin instalado com sucesso \033[0m"
        echo "\033[0;34m Acesse localhost no seu navegador \033[0m";;
    6)
        wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add - &&
        sudo apt-get install apt-transport-https &&
        echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list &&
        sudo apt update &&
        sudo apt install sublime-text -y &&
        echo "\033[0;32m Sublime-Text instalado com sucesso \033[0m";;
    7)
        cd ~/ &&
        wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&
        sudo dpkg -i google-chrome-stable_current_amd64.deb &&
        mv google-chrome-stable_current_amd64.deb ~/Downloads/ &&
        echo "\033[0;32m LAMP e Google Chrome instalado com sucesso \033[0m"
        echo "\033[0;34m Eu salvei o arquivo de instalação na sua pasta de Downloads
        caso não queira usa-lo use o comando  'rm google-chrome-stable_current_amd64.deb ~/Downloads/' \033[0m";;
    8)
        sudo rm -Rf /opt/telegram* &&
        sudo rm -Rf /usr/bin/telegram &&
        sudo rm -Rf /usr/share/applications/telegram.desktop &&
        wget "https://telegram.org/dl/desktop/linux" -O telegram.tar.xz &&
        sudo tar Jxf telegram.tar.xz -C /opt/ &&
        sudo mv /opt/Telegram*/ /opt/telegram &&
        sudo ln -sf /opt/telegram/Telegram /usr/bin/telegram &&
        echo '[Desktop Entry]\n Version=1.0\n Exec=/opt/telegram/Telegram\n Icon=Telegram\n Type=Application\n Categories=Application;Network;' | sudo tee /usr/share/applications/telegram.desktop &&
        echo "\033[0;32m Telegram instalado com sucesso \033[0m";;
    9)
        sudo add-apt-repository ppa:libreoffice/ppa -y &&
        sudo apt update &&
        sudo apt install libreoffice-l10n-pt-br -y && 
        sudo apt install libreoffice-style-sifr -y &&
        echo "\033[0;32m Libre Office instalado com sucesso \033[0m";;
    10)
        sudo apt install ubuntu-restricted-extras -y
        echo "\033[0;32m Codecs instalados com sucesso \033[0m";;
    11)
        sudo apt install unace unrar zip unzip p7zip-full p7zip-rar sharutils rar -y &&
        echo "\033[0;32m Descompactadores instalados com sucesso \033[0m";;
    12)
        sudo add-apt-repository ppa:leaeasy/dde -y &&
	sudo apt update &&
	sudo apt install dde -y &&
	echo "\033[0;32m Deepin Desktop instalado com sucesso \033[0m";;
    13)
        sudo apt update &&
	sudo apt install kdenlive &&
	echo "\033[0;32m Kdenlive instalado com sucesso \033[0m";;
        
    14)
        sudo apt install bleachbit -y &&
        echo "\033[0;32m Bleachbit instalado com sucesso \033[0m";;
    15)
        sudo apt install -y build-essential &&
        sudo apt install git &&
        cd ~/.local &&
        git clone https://github.com/facebook/watchman.git &&
        cd watchman &&
        git checkout v4.1.0 &&
        ./autogen.sh &&
        ./configure &&
        make &&
        sudo make install &&
        cd .. &&
        wget https://facebook.github.io/flow/downloads/flow-linux64-latest.zip &&
        unzip flow-linux64-latest.zip &&
        cd flow &&
        sudo mv flow /usr/local/bin/flow &&
        npm install -g react-native-cli &&
        echo "\033[0;32m React Native instalado com sucesso \033[0m";;
    16) 
        npm install electron &&
        npm install electron-packager -g &&
        echo "\033[0;32m Electron instalado com sucesso \033[0m";;
    17)
        npm install cordova ionic &&
        echo "\033[0;32m Ionic  instalado com sucesso \033[0m" &&
        cordova -v &&
        Ionic -v;;
    18)
        sudo apt install zsh -y &&
        sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" &&
        chsh -s /bin/zsh &&
        echo "\033[0;32m My ZSH instalado com sucesso \033[0m"
        echo "\033[0;32m Será exibido quando reiniciar seu terminal \033[0m";;
    19)
        sudo add-apt-repository ppa:openjdk-r/ppa -y && 
        sudo apt update &&
        sudo apt install openjdk-8-jdk -y &&
        echo "\033[0;32m Open Jdk instalado com sucesso \033[0m";;
    20)
        ;;      
    21)
        sudo apt install qbittorrent -y &&
        echo "\033[0;32m Qbittorrent instalado com sucesso \033[0m";;
    22) 
        sudo apt install inkscape -y &&
        echo "\033[0;32m Inkscape instalado com sucesso \033[0m";;
    23)
        sudo apt install adobe-flashplugin -y &&
        echo "\033[0;32m Adobe Flash Plugin instalado com sucesso \033[0m";;
    24)
        sudo dpkg --add-architecture i386 -y && 
        sudo add-apt-repository ppa:ubuntu-wine/ppa -y && 
        sudo apt update && 
        sudo apt install wine1.8 winetricks -y &&
        echo "\033[0;32m Wine instalado com sucesso \033[0m";;
    25)
        wget -q "http://deb.playonlinux.com/public.gpg" -O- | sudo apt-key add - && sudo wget http://deb.playonlinux.com/playonlinux_trusty.list -O /etc/apt/sources.list.d/playonlinux.list && 
        sudo apt update && 
        sudo apt install playonlinux -y &&
        echo "\033[0;32m Playonlinux instalado com sucesso \033[0m";;
    26)
        sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 && echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list && 
        sudo apt update && 
        sudo apt install spotify-client -y &&
        echo "\033[0;32m Spotify instalado com sucesso \033[0m";;
    27) 
        sudo apt install gimp -y &&
        echo "\033[0;32m Gimp instalado com sucesso \033[0m";;
    28)
        wget http://kdl.cc.ksosoft.com/wps-community/download/a21/wps-office_10.1.0.5672~a21_x86_64.tar.xz -O wpsoffice.tar.xz &&
        sudo tar Jxf wpsoffice.tar.xz -C /opt/ &&
        sudo mv /opt/wps*/ /opt/wpsoffice &&
        echo '[Desktop Entry]\n Version=1.0\n Name=wpswriter\n Exec=/opt/wpsoffice/wps\n Icon=/opt/wpsoffice/resource/icons/hicolor/256x256/apps/wps-office-wpsmain.png\n Type=Application\n Categories=Application' | sudo tee /usr/share/applications/wpswriter.desktop &&
        echo '[Desktop Entry]\n Version=1.0\n Name=wpspresentation\n Exec=/opt/wpsoffice/wpp\n Icon=/opt/wpsoffice/resource/icons/hicolor/256x256/apps/wps-office-wppmain.png\n Type=Application\n Categories=Application' | sudo tee /usr/share/applications/wpspresentation.desktop &&
        echo '[Desktop Entry]\n Version=1.0\n Name=wpsspreadsheets\n Exec=/opt/wpsoffice/et\n Icon=/opt/wpsoffice/resource/icons/hicolor/256x256/apps/wps-office-etmain.png\n Type=Application\n Categories=Application' | sudo tee /usr/share/applications/wpsspreadsheets.desktop &&
        echo "\033[0;32m WPS Office instalado com sucesso \033[0m";;
    0)
        echo "\033[0; Saindo... \033[0m"
        exit;;
    *)
        echo
        echo "\033[0;31m ERRO: opção inválida \033[0m"
        echo ;;
esac
done
