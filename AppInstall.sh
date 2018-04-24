#!/bin/sh

blue="\033[0;34m"
green="\033[0;32m"
red="\033[0;31m"

#!sudo apt update
clear
while true; do
echo "$blue 
 ====================================================================================== \033[0m
$green                              O que vamos instalar agora? \033[0m


$green Desenvolvimento: \033[0m
 
    $green  1\033[0m ➜ $blue Ruby on Rails com RVM \033[0m           |    $green 15\033[0m ➜ $blue React Native  \033[0m
    $green  2\033[0m ➜ $blue Git \033[0m                             |    $green 16\033[0m ➜ $blue Electron  \033[0m
    $green  3\033[0m ➜ $blue Cordova Phonegap \033[0m                |    $green 17\033[0m ➜ $blue Ionic  \033[0m
    $green  4\033[0m ➜ $blue Nodejs 8.x \033[0m                      |    $green 18\033[0m ➜ $blue My ZSH  \033[0m
    $green  5\033[0m ➜ $blue LAMP + PhpMyAdmin \033[0m               |    $green 19\033[0m ➜ $blue Open Jdk 8  \033[0m
    $green  6\033[0m ➜ $blue Visual Code \033[0m                     |    $green 20\033[0m ➜ $blue Java e Jdk Default  \033[0m

$green Ferramentas e outros: \033[0m
$blue 
    $green  7\033[0m ➜ $blue Google Chrome \033[0m                   |    $green 21\033[0m ➜ $blue qbittorrent \033[0m
    $green  8\033[0m ➜ $blue Telegram \033[0m                        |    $green 22\033[0m ➜ $blue Inkscape \033[0m
    $green  9\033[0m ➜ $blue Libre Office \033[0m                    |    $green 23\033[0m ➜ $blue Adobe Flash Plugin \033[0m
    $green 10\033[0m ➜ $blue Ubuntu Restricted Extras \033[0m        |    $green 24\033[0m ➜ $blue Wine \033[0m
    $green 11\033[0m ➜ $blue ZIP, RAR, 7-ZIP, etc. \033[0m           |    $green 25\033[0m ➜ $blue Playonlinux \033[0m
    $green 12\033[0m ➜ $blue Deepin Desktop (Ubuntu 17.04 +) \033[0m |    $green 26\033[0m ➜ $blue Spotify \033[0m
    $green 13\033[0m ➜ $blue Kdenlive \033[0m                        |    $green 27\033[0m ➜ $blue Gimp \033[0m
    $green 14\033[0m ➜ $blue Bleachbit \033[0m                       |    $green 28\033[0m ➜ $blue WPS Office \033[0m
                    
                               $red   
                       00 ➜ Instalar no PC  |    0 ➜ Sair \033[0m 
$blue 
 ================================= Criado por Wilfison Batista ========================  \033[0m
"
echo "$green
              Digite o número do componente a ser instalado: \033[0m
"
echo -n "$green ➜\033[0m "

read opcao

#verificar se foi digitada uma opcao
if [ -z $opcao ]; then
    echo "✗  ERRO: digite uma opcao"
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
        sudo chown -R $(whoami) /var/lib/gems &&
        sudo gem install rails &&
        sudo gem install bundle &&
        echo "$green Ruby On Rails instalado com sucesso \033[0m" &&
        echo "$blue Estamos prontos! Navegue até o diretório do seu projeto e execute 'bundle install' \033[0m";;
    2)
        sudo apt-get install -y build-essential &&
        sudo apt install ssh -y &&
        sudo apt install git -y &&
        echo "$green Git instalado com sucesso \033[0m"
        echo "$green Agora use os seguintes comandos para configurar seu Git \033[0m"
        echo "$blue git config --global user.name 'seu_nome_de_usuário' \033[0m"
        echo "$blue git config --global user.email seu_email_aqui \033[0m";;
    3)
        npm install cordova phonegap &&
        echo "$green Cordova  instalado com sucesso \033[0m" &&
        cordova -v &&
        phonegap -v;;
        
    4)
        sudo apt-get install -y build-essential &&
        curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - &&
        sudo apt-get install nodejs -y &&
        mkdir ~/.npm-global &&
        npm config set prefix '~/.npm-global' &&
        echo "# muda o diretório global do NPM para a home
        export PATH=~/.npm-global/bin:$PATH" >> ~/.profile &&
        source ~/.profile &&
        echo "$green Node instalado com sucesso \033[0m";;
    5)
        sudo apt install lamp-server^ -y &&
        sudo apt install phpmyadmin -y &&
        sudo service apache2 restart
        echo "$green LAMP e PhpMyAdmin instalado com sucesso \033[0m"
        echo "$blue Acesse localhost no seu navegador \033[0m";;
    6)
        curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg &&
        sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg &&
        sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' &&
        sudo apt update &&
        sudo apt-get install code -y &&
        echo "$green Visual Code instalado com sucesso \033[0m";;
    7)
        cd ~/ &&
        wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&
        sudo dpkg -i google-chrome-stable_current_amd64.deb &&
        mv google-chrome-stable_current_amd64.deb ~/Downloads/ &&
        echo "$green LAMP e Google Chrome instalado com sucesso \033[0m"
        echo "$blue Eu salvei o arquivo de instalação na sua pasta de Downloads
        caso não queira usa-lo use o comando  'rm google-chrome-stable_current_amd64.deb ~/Downloads/' \033[0m";;
    8)
        sudo rm -Rf /opt/telegram* &&
        sudo rm -Rf /usr/bin/telegram &&
        sudo rm -Rf /usr/share/applications/telegram.desktop &&
        wget "https://telegram.org/dl/desktop/linux" -O telegram.tar.xz &&
        sudo tar Jxf telegram.tar.xz -C /opt/ &&
        sudo mv /opt/Telegram*/ /opt/telegram &&
        sudo ln -sf /opt/telegram/Telegram /usr/bin/telegram &&
        telegram && exit &&
        echo "$green Telegram instalado com sucesso \033[0m";;
    9)
        sudo add-apt-repository ppa:libreoffice/ppa -y &&
        sudo apt update &&
        sudo apt install libreoffice-l10n-pt-br -y && 
        sudo apt install libreoffice-style-sifr -y &&
        echo "$green Libre Office instalado com sucesso \033[0m";;
    10)
        sudo apt install ubuntu-restricted-extras -y
        echo "$green Codecs instalados com sucesso \033[0m";;
    11)
        sudo apt install unace unrar zip unzip p7zip-full p7zip-rar sharutils rar -y &&
        echo "$green Descompactadores instalados com sucesso \033[0m";;
    12)
        sudo add-apt-repository ppa:leaeasy/dde -y &&
	sudo apt update &&
	sudo apt install dde -y &&
	echo "$green Deepin Desktop instalado com sucesso \033[0m";;
    13)
        sudo apt update &&
	sudo apt install kdenlive &&
	echo "$green Kdenlive instalado com sucesso \033[0m";;
        
    14)
        sudo apt install bleachbit -y &&
        echo "$green Bleachbit instalado com sucesso \033[0m";;

    15)
        sudo apt install -y autoconf automake build-essential python-dev &&
        sudo apt install git &&
        cd ~/.local &&
        git clone https://github.com/facebook/watchman.git &&
        cd watchman &&
        git checkout v4.7.0 &&
        ./autogen.sh &&
        ./configure &&
        make &&
        sudo make install &&
        echo 999999 | sudo tee -a /proc/sys/fs/inotify/max_user_watches && echo 999999 | sudo tee -a /proc/sys/fs/inotify/max_queued_events && 
        echo 999999 | sudo tee -a /proc/sys/fs/inotify/max_user_instances && 
        watchman shutdown-server &&
        cd .. &&
        npm install -g react-native-cli &&
        echo "$green React Native instalado com sucesso \033[0m";;
    16) 
        npm install electron &&
        npm install electron-packager -g &&
        echo "$green Electron instalado com sucesso \033[0m";;
    17)
        npm install cordova ionic &&
        echo "$green Ionic  instalado com sucesso \033[0m" &&
        cordova -v &&
        Ionic -v;;
    18)
        sudo apt install zsh -y &&
        sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" &&
        chsh -s /bin/zsh &&
        echo "$green My ZSH instalado com sucesso \033[0m"
        echo "$green Será exibido quando reiniciar seu terminal \033[0m";;
    19)
        sudo add-apt-repository ppa:openjdk-r/ppa -y && 
        sudo apt update &&
        sudo apt install openjdk-8-jdk -y &&
        echo "$green Open Jdk instalado com sucesso \033[0m";;
    20)
        sudo apt-get install -y default-jre &&
        sudo apt-get install -y default-jdk &&
        echo "$green Java e Jdk Default instalados com sucesso \033[0m";;      
    21)
        sudo apt install qbittorrent -y &&
        echo "$green Qbittorrent instalado com sucesso \033[0m";;
    22) 
        sudo apt install inkscape -y &&
        echo "$green Inkscape instalado com sucesso \033[0m";;
    23)
        sudo apt install adobe-flashplugin -y &&
        echo "$green Adobe Flash Plugin instalado com sucesso \033[0m";;
    24)
        sudo dpkg --add-architecture i386 -y && 
        sudo add-apt-repository ppa:ubuntu-wine/ppa -y && 
        sudo apt update && 
        sudo apt install wine1.8 winetricks -y &&
        echo "$green Wine instalado com sucesso \033[0m";;
    25)
        wget -q "http://deb.playonlinux.com/public.gpg" -O- | sudo apt-key add - && sudo wget http://deb.playonlinux.com/playonlinux_trusty.list -O /etc/apt/sources.list.d/playonlinux.list && 
        sudo apt update && 
        sudo apt install playonlinux -y &&
        echo "$green Playonlinux instalado com sucesso \033[0m";;
    26)
        sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 && echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list && 
        sudo apt update && 
        sudo apt install spotify-client -y &&
        echo "$green Spotify instalado com sucesso \033[0m";;
    27) 
        sudo apt install gimp -y &&
        echo "$green Gimp instalado com sucesso \033[0m";;
    28)
        wget http://kdl.cc.ksosoft.com/wps-community/download/a21/wps-office_10.1.0.5672~a21_x86_64.tar.xz -O wpsoffice.tar.xz &&
        sudo tar Jxf wpsoffice.tar.xz -C /opt/ &&
        sudo mv /opt/wps*/ /opt/wpsoffice &&
        echo '[Desktop Entry]\n Version=1.0\n Name=wpswriter\n Exec=/opt/wpsoffice/wps\n Icon=/opt/wpsoffice/resource/icons/hicolor/256x256/apps/wps-office-wpsmain.png\n Type=Application\n Categories=Application' | sudo tee /usr/share/applications/wpswriter.desktop &&
        echo '[Desktop Entry]\n Version=1.0\n Name=wpspresentation\n Exec=/opt/wpsoffice/wpp\n Icon=/opt/wpsoffice/resource/icons/hicolor/256x256/apps/wps-office-wppmain.png\n Type=Application\n Categories=Application' | sudo tee /usr/share/applications/wpspresentation.desktop &&
        echo '[Desktop Entry]\n Version=1.0\n Name=wpsspreadsheets\n Exec=/opt/wpsoffice/et\n Icon=/opt/wpsoffice/resource/icons/hicolor/256x256/apps/wps-office-etmain.png\n Type=Application\n Categories=Application' | sudo tee /usr/share/applications/wpsspreadsheets.desktop &&
        echo "$green WPS Office instalado com sucesso \033[0m";;
    0)
        echo "\033[0; Saindo... \033[0m"
        exit;;
    00)
        wget https://github.com/Wilfison/AppsInstall/archive/master.zip -O /tmp/AppInstall.zip &&
        unzip /tmp/AppInstall.zip -d /tmp &&      
        mkdir ~/.local/share/AppInstall &&
        cp /tmp/AppsInstall-master/AppInstall.sh ~/.local/share/AppInstall &&
        cp /tmp/AppsInstall-master/AppInstall.desktop ~/.local/share/applications &&
        sudo ln -sf ~/.local/share/AppInstall/AppInstall.sh /usr/bin/appinstall &&
        clear &&
        echo -e "\033[0;31m 
        Agora procure por App Install no seu menu de Aplicativos ou execute 'appinstall' no seu terminal \033[0m";; 
    *)
        echo "$red ERRO: opção inválida \033[0m"
        echo ;;
esac
done
