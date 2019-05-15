#!/bin/bash

blue="\033[0;34m"
green="\033[0;32m"
red="\033[0;31m"
close_color="\033[0m"

while true; do

echo -e "$blue 
 ====================================================================================== $close_color
$green                              O que vamos instalar agora? $close_color


$green Desenvolvimento: $close_color
 
	$green  1 $close_color ➜ $blue RVM + Rails + PostgreSql $close_color        |    $green 12 $close_color ➜ $blue React Native  $close_color
	$green  2 $close_color ➜ $blue Git $close_color                             |    $green 13 $close_color ➜ $blue Electron  $close_color
	$green  3 $close_color ➜ $blue NVM $close_color                             |    $green 14 $close_color ➜ $blue Ionic  $close_color
	$green  4 $close_color ➜ $blue Nodejs 12 $close_color                       |    $green 15 $close_color ➜ $blue My ZSH  $close_color
	$green  5 $close_color ➜ $blue LAMP + PhpMyAdmin $close_color               |    $green 16 $close_color ➜ $blue Open Jdk 8  $close_color
	$green  6 $close_color ➜ $blue Visual Code $close_color                     |    $green 27 $close_color ➜ $blue Java e Jdk Default  $close_color

$green Ferramentas e outros: $close_color

	$green  7 $close_color ➜ $blue Google Chrome $close_color            
	$green  8 $close_color ➜ $blue Telegram $close_color                 
	$green 10 $close_color ➜ $blue Ubuntu Restricted Extras $close_color 
	$green 11 $close_color ➜ $blue ZIP, RAR, 7-ZIP, etc.  $close_color
					
								 
		            00 ➜ Instalar no PC  |    0 ➜ Sair  
$blue 
 ================================= Criado por Wilfison Batista ========================  $close_color
"
echo -e "$green
			  Digite o número do componente a ser instalado: $close_color
"
echo -e -n "$green ➜$close_color "

read opcao

#verifica se foi digitada uma opcao
if [ -z $opcao ]; then
	echo -e "$red ✗ ERRO: $close_color digite uma opcao válida!"
	exit
fi

case $opcao in
	1)
		echo -e "Qual versão do ruby você irá ultilizar? "
		read rubyversion
		if [ -z $rubyversion ]; then
			rubyversion=2.5.1
			echo -e $rubyversion
			exit;
		fi
		rubyInstall=rvm install $rubyversion
		echo -e "$green Instalando componentes necessários! $close_color" &&
		sudo apt install -y build-essential curl gnupg2 autoconf bison libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm-dev libpq-dev ruby-dev &&
		echo -e "$green Instalando RVM $close_color" &&
		gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB &&
		\curl -sSL https://get.rvm.io | bash -s stable &&
		echo -e "$green Instalando Ruby $close_color" &&
		$rubyInstall &&
		echo -e "$green Instalando o Rails $close_color" &&
		\curl -sSL https://get.rvm.io | bash -s stable --rails &&
		echo -e "$green Instalando PostgreSql $close_color" &&
		sudo apt install postgresql postgresql-contrib libpq-dev -y &&
		sudo chown -R $(whoami) /var/lib/gems &&
		echo -e "$green Finalizando $close_color" &&
		sudo gem install rails &&
		sudo gem install bundle &&
		echo -e "$green Ruby On Rails instalado com sucesso $close_color" &&
		echo -e "$blue Estamos prontos! Navegue até o diretório do seu projeto e execute 'bundle install' $close_color";;



	2)
		echo -e "$green Instalando componentes necessários! $close_color" &&
		sudo apt-get install -y build-essential &&
		echo -e "$green Instalando SSH $close_color" &&
		sudo apt install ssh -y &&
		echo -e "$green Instalando o GIT $close_color" &&
		sudo apt install git -y &&
		echo -e "$green Git instalado com sucesso $close_color"
		echo -e "$green Agora use os seguintes comandos para configurar seu Git $close_color"
		echo -e "$blue git config --global user.name 'seu_nome_de_usuário' $close_color"
		echo -e "$blue git config --global user.email seu_email_aqui $close_color";;



	3)
		echo -e "$green Instalando componentes necessários! $close_color" &&
		sudo apt install build-essential checkinstall libssl-dev &&
		echo -e "$green Baixando o código fonte! $close_color" &&
		curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash &&
		echo -e "$green Atualizando as variáveis do sitema! $close_color" &&
		export NVM_DIR="$HOME/.nvm" >> ~/.profile &&
		[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  >> ~/.profile &&
		[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" >> ~/.profile &&
		source ~/.profile &&
		command -v nvm &&
		echo -e "$green NVM  instalado com sucesso na versão: $close_color" &&
		nvm --version;;


		
	4)
		echo -e "$green Instalando componentes necessários! $close_color" &&
		sudo apt-get install -y build-essential &&
		echo -e "$green Baixando instalador $close_color" &&
		curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash - &&
		echo -e "$green Instalando... $close_color" &&
		sudo apt-get install nodejs -y &&
		mkdir ~/.npm-global &&
		npm config set prefix '~/.npm-global' &&
		echo -e "$green Mudando o diretório global do NPM para a home $close_color"
		export PATH="~/.npm-global/bin:$PATH" >> ~/.profile &&
		source ~/.profile &&
		echo -e "$green Node instalado com sucesso! Você pode usar o NPM sem sudo $close_color";;



	5)
		echo -e "$green Instalando LAMP $close_color" &&
		sudo apt install lamp-server^ -y &&
		echo -e "$green Instalando PhpMyAdmin $close_color" &&
		sudo apt install phpmyadmin -y &&
		echo -e "$green Reiniciando o Apache... $close_color" &&
		sudo service apache2 restart &&
		echo -e "$green LAMP e PhpMyAdmin instalado com sucesso $close_color" &&
		xdg-open http://127.0.0.1/;;



	6)
		echo -e "$green Instalando chave de acesso! $close_color" &&
		curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg &&
		sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg &&
		sudo sh -c 'echo -e "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' &&
		echo -e "$green Atualizando... $close_color" &&
		sudo apt update &&
		echo -e "$green Instalando vscode $close_color" &&
		sudo apt install code -y &&
		echo -e "$green Visual Code instalado com sucesso $close_color"
		code;;



	7)
		cd ~/ &&
		echo -e "$green Baixando o instalador... $close_color" &&
		wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&
		echo -e "$green Instalando... $close_color" &&
		sudo dpkg -i google-chrome-stable_current_amd64.deb &&
		rm google-chrome-stable_current_amd64.deb &&
		echo -e "$green Google Chrome instalado com sucesso $close_color"
		google-chrome &;;



	8)
		cd ~/ &&
		echo -e "$green Baixando o instalador... $close_color" &&
		wget "https://telegram.org/dl/desktop/linux" -O telegram.tar.xz &&
		echo -e "$green Verificando se existe versão anterior... $close_color" &&
		sudo rm -f -Rf /opt/telegram* &&
		sudo rm -f -Rf /usr/bin/telegram &&
		sudo rm -f -Rf /usr/share/applications/telegram.desktop &&
		echo -e "$green Instalando... $close_color" &&
		sudo tar Jxf telegram.tar.xz -C /opt/ &&
		sudo mv /opt/Telegram* /opt/telegram &&
		sudo ln -sf /opt/telegram/Telegram /usr/bin/telegram &&
		rm -f telegram.tar.xz &&
		echo -e "$green Telegram instalado com sucesso $close_color" &&
		telegram &;;



	10)
		echo -e "$green Instalando... $close_color" &&
		sudo apt install -y ubuntu-restricted-extras vlc &&
		echo -e "$green Codecs instalados com sucesso $close_color";;



	11)
		echo -e "$green Instalando... $close_color" &&
		sudo apt install unace unrar zip unzip p7zip-full p7zip-rar sharutils rar -y &&
		echo -e "$green Descompactadores instalados com sucesso $close_color";;



	12)
		echo -e "$green Configurando ambiente! $close_color" &&
		sudo apt install -y autoconf automake build-essential python-dev &&
		echo -e "$green Verificando... $close_color" &&
		sudo apt install git &&
		echo -e "$green Instalando... $close_color" &&
		npm install -g react-native-cli &&
		echo -e "$green React Native instalado com sucesso! Comando disponivel 'create-react-native-app myapp' $close_color";;



	13) 
		echo -e "$green Instalando... $close_color" &&
		npm i -g electron electron-packager &&
		echo -e "$green Electron instalado com sucesso $close_color";;



	14)
		echo -e "$green Instalando... $close_color" &&
		npm i -g cordova ionic &&
		echo -e "$green Ionic  instalado com sucesso na versão: $close_color" &&
		cordova -v &&
		Ionic -v;;



	15)
		echo -e "$green Instalando... $close_color" &&
		sudo apt install zsh -y &&
		echo -e "$green Verificando... $close_color" &&
		sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" &&
		echo -e "$green Definindo como SHELL padrão! $close_color" &&
		chsh -s /bin/zsh &&
		echo -e "$green My ZSH instalado com sucesso $close_color"
		echo -e "$green Será exibido quando reiniciar. Ou você pode abrir um novo terminal e digitar 'zsh' $close_color";;



	16)
		echo -e "$green Verificando PPA $close_color" &&
		sudo add-apt-repository ppa:openjdk-r/ppa -y && 
		echo -e "$green Atualizando... $close_color" &&
		sudo apt update &&
		echo -e "$green Instalando... $close_color" &&
		sudo apt install openjdk-8-jdk -y &&
		echo -e "$green Open Jdk instalado com sucesso $close_color";;



	27)
		echo -e "$green Instalando... $close_color" &&
		sudo apt-get install -y default-jre default-jdk &&
		echo -e "$green Java e Jdk Default instalados com sucesso $close_color";;    

	0)
		echo -e "\033[0; Saindo... $close_color"
		exit;;


	00)
		echo -e "$green Baixando instalador... $close_color" &&
		wget https://github.com/Wilfison/AppsInstall/archive/master.zip -O /tmp/AppInstall.zip &&
		unzip /tmp/AppInstall.zip -d /tmp &&      
		mkdir ~/.local/share/AppInstall &&
		cp /tmp/AppsInstall-master/AppInstall.sh ~/.local/share/AppInstall &&
		cp /tmp/AppsInstall-master/AppInstall.svg ~/.local/share/AppInstall &&
		cp /tmp/AppsInstall-master/AppInstall.desktop ~/.local/share/applications &&
		sudo ln -sf ~/.local/share/AppInstall/AppInstall.sh /usr/bin/appinstall &&
		clear &&
		echo -e "$green App Install instalado com sucesso $close_color" &&
		echo -e -e "Agora procure por App Install no seu menu de Aplicativos ou execute 'appinstall' no seu terminal";; 



	*)
		echo -e "$red ERRO: Digite somente o número de uma das opções acima! $close_color"
		echo -e ;;
esac
done
