#!/bin/bash

BASEDIR=$(dirname "$0")
source $BASEDIR/components/colors.sh

while true; do

echo -e "$blue
 =======================================================================
 |                       O que vamos instalar agora?                   |
 =======================================================================
$close_color
$green Desenvolvimento: $close_color
 
$green  1 $close_color ➜ $blue RVM + Rails + PostgreSql $close_color |    $green 12 $close_color ➜ $blue React Native CLI  $close_color      
$green  2 $close_color ➜ $blue Git $close_color                      |    $green 13 $close_color ➜ $blue Electron  $close_color          
$green  3 $close_color ➜ $blue NVM $close_color                      |    $green 14 $close_color ➜ $blue Ionic  $close_color             
$green  4 $close_color ➜ $blue Nodejs 12 $close_color                |    $green 15 $close_color ➜ $blue My ZSH  $close_color						
$green  5 $close_color ➜ $blue LAMP + PhpMyAdmin $close_color        |    $green 16 $close_color ➜ $blue Open Jdk 8  $close_color				
$green  6 $close_color ➜ $blue Visual Code $close_color              |    $green 17 $close_color ➜ $blue Docker  $close_color
																																																																					
$green Ferramentas e outros: $close_color																																																
																																																																					
$green  7 $close_color ➜ $blue Google Chrome $close_color            																																		
$green  8 $close_color ➜ $blue Telegram $close_color                 																																		
$green 10 $close_color ➜ $blue Ubuntu Restricted Extras $close_color 																																		
$green 11 $close_color ➜ $blue ZIP, RAR, 7-ZIP, etc.  $close_color																																				
																																																																					
																																																																					
		    00 ➜ Instalar no PC    0 ➜ Sair  																																											
$blue
 ====================== Criado por Wilfison Batista ===================== $close_color
"
echo -e "$green Digite o número dos componentes a serem instalados separados por virgula: ex: 2,10,11 $close_color"

echo -e -n "$green \n\r ➜$close_color "

read opcao

#verifica se foi digitada uma opcao
if [ -z $opcao ]; then
	echo -e "$red ✗ ERRO: $close_color digite uma opcao válida!"
	exit
fi
 
current_option=$(echo $opcao | tr "," " ")

for addr in $current_option
do
	case $addr in
		1) bash $BASEDIR/components/rails_rvm.sh;;

		2) bash $BASEDIR/components/git.sh;;

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
			sudo rm -rf -f /opt/telegram* &&
			sudo rm -rf -f /usr/bin/telegram &&
			sudo rm -rf -f /usr/share/applications/telegram.desktop &&
			echo -e "$green Instalando... $close_color" &&
			sudo tar Jxf telegram.tar.xz -C /opt/ &&
			sudo mv /opt/Telegram* /opt/telegram &&
			sudo ln -sf /opt/telegram/Telegram /usr/bin/telegram &&
			sudo chmod -R 777 /opt/telegram &&
			echo '[Desktop Entry]\n Version=1.0\n Name=Telegram Desktop\n Comment=Official desktop application for the Telegram messaging service\n TryExec=/home/william/telegram/Telegram\n Exec=/opt/telegram/Telegram -- %u\n Icon=telegram\n Terminal=false\n StartupWMClass=TelegramDesktop\n Type=Application\n Categories=Network;InstantMessaging;Qt;\n MimeType=x-scheme-handler/tg;\n Keywords=tg;chat;im;messaging;messenger;sms;tdesktop;\n X-GNOME-UsesNotifications=true' | sudo tee /usr/share/applications/telegramdesktop.desktop &&
			rm -f telegram.tar.xz &&
			echo -e "$green Telegram instalado com sucesso $close_color";;



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



		17)
			echo -e "$green Removendo versões antigas $close_color"
			sudo apt remove -y docker docker-engine docker.io containerd runc &&
			echo -e "$green Configurando ambiente! $close_color"
			sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common &&
			echo -e "$green Instalando... $close_color"
			curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - &&
			sudo apt install -y docker-ce docker-ce-cli containerd.io &&
			sudo apt update &&
			sudo groupadd docker &&
			sudo usermod -aG docker $USER &&
			echo -e "$green Docker instalados com sucesso $close_color";;    

		0)
			echo -e "\033[0; Saindo... $close_color"
			exit;;


		00)
			echo -e "$green Baixando instalador... $close_color" &&
			wget https://github.com/Wilfison/AppsInstall/archive/master.zip -O ~/AppInstall.zip &&
			unzip ~/AppInstall.zip -d ~/ &&
			rm -rf -f ~/.local/share/AppInstall &&
			rm -f ~/.local/share/applications/AppInstall.desktop &&
			mv ~/AppsInstall-master ~/.local/share/AppInstall &&
			sudo mv ~/.local/share/AppInstall/AppInstall.desktop /usr/share/applications &&
			sudo ln -sf ~/.local/share/AppInstall/AppInstall.sh /usr/bin/appinstall &&
			rm ~/AppInstall.zip &&
			clear &&
			echo -e "$green App Install instalado com sucesso $close_color" &&
			echo -e -e "Agora procure por App Install no seu menu de Aplicativos ou execute 'appinstall' no seu terminal";; 



		*)
			echo -e "$red ERRO: Digite somente o número de uma das opções acima! $close_color"
			echo -e ;;
	esac
	done
done

