#!/bin/sh

blue="\033[0;34m"
green="\033[0;32m"
red="\033[0;31m"

if [ $SHELL = "/usr/bin/bash" ]; then
	myshell="~/.bashrc"
fi
if [ $SHELL = "/usr/bin/zsh" ]; then
	myshell="~/.zshrc"
fi
#!sudo apt update
# clear
while true; do

echo "$blue 
 ====================================================================================== \033[0m
$green                              O que vamos instalar agora? \033[0m


$green Desenvolvimento: \033[0m
 
	$green  1 \033[0m ➜ $blue RVM + Rails + PostgreSql \033[0m        |    $green 15 \033[0m ➜ $blue React Native  \033[0m
	$green  2 \033[0m ➜ $blue Git \033[0m                             |    $green 16 \033[0m ➜ $blue Electron  \033[0m
	$green  3 \033[0m ➜ $blue NVM \033[0m                             |    $green 17 \033[0m ➜ $blue Ionic  \033[0m
	$green  4 \033[0m ➜ $blue Nodejs 11 \033[0m                       |    $green 18 \033[0m ➜ $blue My ZSH  \033[0m
	$green  5 \033[0m ➜ $blue LAMP + PhpMyAdmin \033[0m               |    $green 19 \033[0m ➜ $blue Open Jdk 8  \033[0m
	$green  6 \033[0m ➜ $blue Visual Code \033[0m                     |    $green 20 \033[0m ➜ $blue Java e Jdk Default  \033[0m

$green Ferramentas e outros: \033[0m

	$green  7 \033[0m ➜ $blue Google Chrome \033[0m                   |    $green 21 \033[0m ➜ $blue qbittorrent \033[0m
	$green  8 \033[0m ➜ $blue Telegram \033[0m                        |    $green 22 \033[0m ➜ $blue Inkscape \033[0m
	$green  9 \033[0m ➜ $blue Libre Office \033[0m                    |    $green 23 \033[0m ➜ $blue Adobe Flash Plugin \033[0m
	$green 10 \033[0m ➜ $blue Ubuntu Restricted Extras \033[0m        |    $green 24 \033[0m ➜ $blue Wine \033[0m
	$green 11 \033[0m ➜ $blue ZIP, RAR, 7-ZIP, etc. \033[0m           |    $green 25 \033[0m ➜ $blue Playonlinux \033[0m
	$green 12 \033[0m ➜ $blue Deepin Desktop (Ubuntu 17.04 +) \033[0m |    $green 26 \033[0m ➜ $blue Spotify \033[0m
	$green 13 \033[0m ➜ $blue Kdenlive \033[0m                        |    $green 27 \033[0m ➜ $blue Gimp \033[0m
	$green 14 \033[0m ➜ $blue Stacer \033[0m                          |    $green 28 \033[0m ➜ $blue WPS Office \033[0m
					
								 
		            00 ➜ Instalar no PC  |    0 ➜ Sair  
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
	echo "✗  ERRO: digite uma opcao válida!"
	exit
fi

case $opcao in
	1)
		echo "$green Instalando componentes necessários! \033[0m" &&
		sudo apt install -y build-essential curl gnupg2 autoconf bison libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm-dev libpq-dev ruby-dev &&
		echo "$green Instalando RVM \033[0m" &&
		gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 &&
		\curl -sSL https://get.rvm.io | bash &&
		echo "$green Instalando Ruby \033[0m" &&
		\curl -sSL https://get.rvm.io | bash -s stable --ruby &&
		echo "$green Instalando o Rails \033[0m" &&
		\curl -sSL https://get.rvm.io | bash -s stable --rails &&
		echo "$green Instalando PostgreSql \033[0m" &&
		sudo apt install postgresql postgresql-contrib libpq-dev -y &&
		sudo chown -R $(whoami) /var/lib/gems &&
		echo "$green Finalizando \033[0m" &&
		sudo gem install rails &&
		sudo gem install bundle &&
		echo "$green Ruby On Rails instalado com sucesso \033[0m" &&
		echo "$blue Estamos prontos! Navegue até o diretório do seu projeto e execute 'bundle install' \033[0m";;



	2)
		echo "$green Instalando componentes necessários! \033[0m" &&
		sudo apt-get install -y build-essential &&
		echo "$green Instalando SSH \033[0m" &&
		sudo apt install ssh -y &&
		echo "$green Instalando o GIT \033[0m" &&
		sudo apt install git -y &&
		echo "$green Git instalado com sucesso \033[0m"
		echo "$green Agora use os seguintes comandos para configurar seu Git \033[0m"
		echo "$blue git config --global user.name 'seu_nome_de_usuário' \033[0m"
		echo "$blue git config --global user.email seu_email_aqui \033[0m";;



	3)
		echo "$green Instalando componentes necessários! \033[0m" &&
		sudo apt install build-essential checkinstall &&
		sudo apt install libssl-dev &&
		echo "$green Baixando o código fonte! \033[0m" &&
		curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash &&
		echo "$green Atualizando as variáveis! \033[0m" &&
		source $myshell &&
		command -v nvm &&
		echo "$green NVM  instalado com sucesso na versão: \033[0m" &&
		nvm --version;;


		
	4)
		echo "$green Instalando componentes necessários! \033[0m" &&
		sudo apt-get install -y build-essential &&
		echo "$green Baixando instalador \033[0m" &&
		curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash - &&
		echo "$green Instalando... \033[0m" &&
		sudo apt-get install nodejs -y &&
		mkdir ~/.npm-global &&
		npm config set prefix '~/.npm-global' &&
		echo "$green Mudando o diretório global do NPM para a home \033[0m"
		export PATH="~/.npm-global/bin:$PATH" >> ~/.profile &&
		source ~/.profile &&
		echo "$green Node instalado com sucesso! Você pode usar o NPM sem sudo \033[0m";;



	5)
		echo "$green Instalando LAMP \033[0m" &&
		sudo apt install lamp-server^ -y &&
		echo "$green Instalando PhpMyAdmin \033[0m" &&
		sudo apt install phpmyadmin -y &&
		echo "$green Reiniciando o Apache... \033[0m" &&
		sudo service apache2 restart
		echo "$green LAMP e PhpMyAdmin instalado com sucesso \033[0m"
		echo "$blue Acesse localhost no seu navegador para verificar se está tudo OK \033[0m";;



	6)
		echo "$green Instalando chave de acesso! \033[0m" &&
		curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg &&
		sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg &&
		sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' &&
		echo "$green Atualizando... \033[0m" &&
		sudo apt update &&
		echo "$green Instalando vscode \033[0m" &&
		sudo apt-get install code -y &&
		echo "$green Visual Code instalado com sucesso \033[0m";;



	7)
		cd ~/ &&
		echo "$green Baixando o instalador... \033[0m" &&
		wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&
		echo "$green Instalando... \033[0m" &&
		sudo dpkg -i google-chrome-stable_current_amd64.deb &&
		mv google-chrome-stable_current_amd64.deb ~/Downloads/ &&
		echo "$green Google Chrome instalado com sucesso \033[0m"
		echo "$blue Eu salvei o arquivo de instalação na sua pasta de Downloads
		caso não queira usa-lo use o comando  'rm ~/Downloads/google-chrome-stable_current_amd64.deb' \033[0m";;



	8)
		echo "$green Verificando... \033[0m" &&
		sudo rm -Rf /opt/telegram* &&
		sudo rm -Rf /usr/bin/telegram &&
		sudo rm -Rf /usr/share/applications/telegram.desktop &&
		echo "$green Baixando o instalador... \033[0m" &&
		wget "https://telegram.org/dl/desktop/linux" -O telegram.tar.xz &&
		sudo tar Jxf telegram.tar.xz -C /opt/ &&
		sudo mv /opt/Telegram*/ /opt/telegram &&
		sudo ln -sf /opt/telegram/Telegram /usr/bin/telegram &&
		telegram && exit &&
		echo "$green Telegram instalado com sucesso \033[0m";;



	9)
		echo "$green Adicionando PPA \033[0m" &&
		sudo add-apt-repository ppa:libreoffice/ppa -y &&
		echo "$green Atualizando... \033[0m" &&
		sudo apt update &&
		echo "$green Instalando... \033[0m" &&
		sudo apt install libreoffice-l10n-pt-br -y && 
		sudo apt install libreoffice-style-sifr -y &&
		echo "$green Libre Office instalado com sucesso \033[0m";;



	10)
		echo "$green Instalando... \033[0m" &&
		sudo apt install -y ubuntu-restricted-extras vlc &&
		echo "$green Codecs instalados com sucesso \033[0m";;



	11)
		echo "$green Instalando... \033[0m" &&
		sudo apt install unace unrar zip unzip p7zip-full p7zip-rar sharutils rar -y &&
		echo "$green Descompactadores instalados com sucesso \033[0m";;



	12)
		echo "$green Adicionando PPA... \033[0m" &&
		sudo add-apt-repository ppa:leaeasy/dde -y &&
		echo "$green Atualizando... \033[0m" &&
		sudo apt update &&
		echo "$green Instalando... \033[0m" &&
		sudo apt install dde -y &&
		echo "$green Deepin Desktop instalado com sucesso \033[0m";;



	13)
		echo "$green Atualizando... \033[0m" &&
		sudo apt update &&
		echo "$green Instalando... \033[0m" &&
		sudo apt install kdenlive &&
		echo "$green Kdenlive instalado com sucesso \033[0m";;


		
	14)
		echo "$green Adicionando PPA... \033[0m" &&
		sudo add-apt-repository ppa:oguzhaninan/stacer &&
		echo "$green Atualizando... \033[0m" &&
		sudo apt update &&
		echo "$green Instalando... \033[0m" &&
		sudo apt install stacer &&
		echo "$green Stacer instalado com sucesso \033[0m";;

	15)
		echo "$green Configurando ambiente! \033[0m" &&
		sudo apt install -y autoconf automake build-essential python-dev &&
		echo "$green Verificando... \033[0m" &&
		sudo apt install git &&
		echo "$green Instalando... \033[0m" &&
		npm install -g react-native-cli &&
		echo "$green React Native instalado com sucesso! Comando disponivel 'create-react-native-app myapp' \033[0m";;



	16) 
		echo "$green Instalando... \033[0m" &&
		npm i -g electron electron-packager &&
		echo "$green Electron instalado com sucesso \033[0m";;



	17)
		echo "$green Instalando... \033[0m" &&
		npm i -g cordova ionic &&
		echo "$green Ionic  instalado com sucesso na versão: \033[0m" &&
		cordova -v &&
		Ionic -v;;



	18)
		echo "$green Instalando... \033[0m" &&
		sudo apt install zsh -y &&
		echo "$green Verificando... \033[0m" &&
		sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" &&
		echo "$green Definindo como SHELL padrão! \033[0m" &&
		chsh -s /bin/zsh &&
		echo "$green My ZSH instalado com sucesso \033[0m"
		echo "$green Será exibido quando reiniciar. Ou você pode abrir um novo terminal e digitar 'zsh' \033[0m";;



	19)
		echo "$green Verificando PPA \033[0m" &&
		sudo add-apt-repository ppa:openjdk-r/ppa -y && 
		echo "$green Atualizando... \033[0m" &&
		sudo apt update &&
		echo "$green Instalando... \033[0m" &&
		sudo apt install openjdk-8-jdk -y &&
		echo "$green Open Jdk instalado com sucesso \033[0m";;



	20)
		echo "$green Instalando... \033[0m" &&
		sudo apt-get install -y default-jre default-jdk &&
		echo "$green Java e Jdk Default instalados com sucesso \033[0m";;    



	21)
		echo "$green Instalando... \033[0m" &&
		sudo apt install qbittorrent -y &&
		echo "$green Qbittorrent instalado com sucesso \033[0m";;


	22) 
		echo "$green Instalando... \033[0m" &&
		sudo apt install inkscape -y &&
		echo "$green Inkscape instalado com sucesso \033[0m";;



	23)
		echo "$green Instalando... \033[0m" &&
		sudo apt install adobe-flashplugin -y &&
		echo "$green Adobe Flash Plugin instalado com sucesso \033[0m";;



	24)
		echo "$green Configurando... \033[0m" &&
		sudo dpkg --add-architecture i386 -y && 
		echo "$green Instalando PPA \033[0m" &&
		sudo add-apt-repository ppa:ubuntu-wine/ppa -y && 
		echo "$green Atualizando... \033[0m" &&
		sudo apt update && 
		echo "$green Instalando... \033[0m" &&
		sudo apt install wine1.8 winetricks -y &&
		echo "$green Wine instalado com sucesso \033[0m";;



	25)
		echo "$green Verificando... \033[0m" &&
		wget -q "http://deb.playonlinux.com/public.gpg" -O- | sudo apt-key add - && sudo wget http://deb.playonlinux.com/playonlinux_trusty.list -O /etc/apt/sources.list.d/playonlinux.list && 
		sudo apt update && 
		echo "$green Instalando... \033[0m" &&
		sudo apt install playonlinux -y &&
		echo "$green Playonlinux instalado com sucesso \033[0m";;



	26)
		echo "$green Instalando chave de segurança! \033[0m" &&
		sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 && echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list && 
		sudo apt update && 
		echo "$green Instalando... \033[0m" &&
		sudo apt install spotify-client -y &&
		echo "$green Spotify instalado com sucesso \033[0m";;



	27) 
		echo "$green Instalando... \033[0m" &&
		sudo apt install gimp -y &&
		echo "$green Gimp instalado com sucesso \033[0m";;



	28)
		echo "$green Baixando instalador... Aguarde! \033[0m" &&
		wget http://kdl.cc.ksosoft.com/wps-community/download/a21/wps-office_10.1.0.5672~a21_x86_64.tar.xz -O wpsoffice.tar.xz &&
		echo "$green Instalando... \033[0m" &&
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
		echo "$green Baixando instalador... \033[0m" &&
		wget https://github.com/Wilfison/AppsInstall/archive/master.zip -O /tmp/AppInstall.zip &&
		unzip /tmp/AppInstall.zip -d /tmp &&      
		mkdir ~/.local/share/AppInstall &&
		cp /tmp/AppsInstall-master/AppInstall.sh ~/.local/share/AppInstall &&
		cp /tmp/AppsInstall-master/AppInstall.svg ~/.local/share/AppInstall &&
		cp /tmp/AppsInstall-master/AppInstall.desktop ~/.local/share/applications &&
		sudo ln -sf ~/.local/share/AppInstall/AppInstall.sh /usr/bin/appinstall &&
		clear &&
		echo "$green App Install instalado com sucesso \033[0m" &&
		echo -e "Agora procure por App Install no seu menu de Aplicativos ou execute 'appinstall' no seu terminal";; 



	*)
		echo "$red ERRO: Digite somente o número de uma das opções acima! \033[0m"
		echo ;;
esac
done
