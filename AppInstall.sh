#!/bin/bash

BASEDIR=$(dirname "$0")
source $BASEDIR/components/colors.sh
source $BASEDIR/components/profile.sh

while true; do

echo -e "$blue
 =======================================================================
 |                   What are we going to install now?                 |
 =======================================================================
$close_color
$green Development: $close_color
 
$green  1 $close_color ➜ $blue RVM + Rails + PostgreSql $close_color |    $green 12 $close_color ➜ $blue React Native CLI  $close_color
$green  2 $close_color ➜ $blue Git $close_color                      |    $green 13 $close_color ➜ $blue Electron  $close_color
$green  3 $close_color ➜ $blue NVM $close_color                      |    $green 14 $close_color ➜ $blue Ionic  $close_color
$green  4 $close_color ➜ $blue Nodejs 12 $close_color                |    $green 15 $close_color ➜ $blue My ZSH  $close_color
$green  5 $close_color ➜ $blue LAMP + PhpMyAdmin $close_color        |    $green 16 $close_color ➜ $blue Open Jdk 8  $close_color
$green  6 $close_color ➜ $blue Visual Code $close_color              |    $green 17 $close_color ➜ $blue Docker  $close_color
																																		
$green Tools and others: $close_color														
																																		
$green  7 $close_color ➜ $blue Google Chrome $close_color           
$green  8 $close_color ➜ $blue Telegram $close_color                
$green 10 $close_color ➜ $blue Ubuntu Restricted Extras $close_color
$green 11 $close_color ➜ $blue ZIP, RAR, 7-ZIP, etc.  $close_color	
																																		
																																		
		               0 ➜ Sair  																				
$blue
 ====================== Created by Wilfison Batista ===================== $close_color
"
echo -e "$green Enter the number of components to install by comma-separated: $close_color"

echo -e -n "$green \n\r ➜$close_color "

read option

#check if an option has been entered
if [ -z $option ]; then
	echo -e "$red ✗ ERROR: $close_color Please enter a valid option!"
	exit
fi
 
options=$(echo $option | tr "," " ")

for addr in $options
do
	case $addr in
		1) bash $BASEDIR/components/rails_rvm.sh;;

		2) bash $BASEDIR/components/git.sh;;

		3) bash $BASEDIR/components/nvm.sh;;

		4)
			echo -e "$green Installing required components! $close_color" &&
			sudo apt install -y build-essential &&
			echo -e "$green Download installer $close_color" &&
			curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash - &&
			echo -e "$green Installing... $close_color" &&
			sudo apt install nodejs -y &&
			sudo chown -R $(whoami) /usr/local/lib/node_modules &&
			source $MY_PROFILE &&
			echo -e "$green Node successfully installed! You can use NPM without # sudo $close_color";;



		5)
			echo -e "$green Installing.. $close_color" &&
			sudo apt install lamp-server^ -y &&
			echo -e "$green Installing PhpMyAdmin $close_color" &&
			sudo apt install phpmyadmin -y &&
			echo -e "$green Rebooting Apache... $close_color" &&
			sudo service apache2 restart &&
			echo -e "$green LAMP e PhpMyAdmin successfully installed $close_color" &&
			xdg-open http://127.0.0.1/;;


		6) bash $BASEDIR/components/vscode.sh;;


		7)
			cd ~/ &&
			echo -e "$green Downloading installer... $close_color" &&
			wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&
			echo -e "$green Installing... $close_color" &&
			sudo dpkg -i google-chrome-stable_current_amd64.deb &&
			rm google-chrome-stable_current_amd64.deb &&
			echo -e "$green Google Chrome successfully installed $close_color"
			google-chrome &;;



		8)
			cd ~/ &&
			echo -e "$green Downloading installer... $close_color" &&
			wget "https://telegram.org/dl/desktop/linux" -O telegram.tar.xz &&
			echo -e "$green Checking previous version... $close_color" &&
			sudo rm -rf -f /opt/telegram* &&
			sudo rm -rf -f /usr/bin/telegram &&
			sudo rm -rf -f /usr/share/applications/telegram.desktop &&
			echo -e "$green Installing... $close_color" &&
			sudo tar Jxf telegram.tar.xz -C /opt/ &&
			sudo mv /opt/Telegram* /opt/telegram &&
			sudo ln -sf /opt/telegram/Telegram /usr/bin/telegram &&
			sudo chmod -R 777 /opt/telegram &&
			echo '[Desktop Entry]\n Version=1.0\n Name=Telegram Desktop\n Comment=Official desktop application for the Telegram messaging service\n TryExec=/home/william/telegram/Telegram\n Exec=/opt/telegram/Telegram -- %u\n Icon=telegram\n Terminal=false\n StartupWMClass=TelegramDesktop\n Type=Application\n Categories=Network;InstantMessaging;Qt;\n MimeType=x-scheme-handler/tg;\n Keywords=tg;chat;im;messaging;messenger;sms;tdesktop;\n X-GNOME-UsesNotifications=true' | sudo tee /usr/share/applications/telegramdesktop.desktop &&
			rm -f telegram.tar.xz &&
			echo -e "$green Telegram successfully installed $close_color";;



		10)
			echo -e "$green Installing... $close_color" &&
			sudo apt install -y ubuntu-restricted-extras vlc &&
			echo -e "$green Codecs successfully installed $close_color";;



		11)
			echo -e "$green Installing... $close_color" &&
			sudo apt install unace unrar zip unzip p7zip-full p7zip-rar sharutils rar -y &&
			echo -e "$green Descompactadores successfully installed $close_color";;



		12)
			echo -e "$green Setting up environment! $close_color" &&
			sudo apt install -y autoconf automake build-essential python-dev git &&
			echo -e "$green Installing... $close_color" &&
			npm install -g react-native-cli &&
			echo -e "$green React Native successfully installed! \n"
			echo -e "$green Now use$close_color $blue create-react-native-app myapp $close_color";;



		13) 
			echo -e "$green Installing... $close_color" &&
			npm i -g electron electron-packager &&
			echo -e "$green Electron successfully installed $close_color";;



		14)
			echo -e "$green Installing... $close_color" &&
			npm i -g cordova ionic &&
			echo -e "$green Ionic  successfully installed on version: $close_color" &&
			cordova -v &&
			Ionic -v;;



		15)
			echo -e "$green Installing... $close_color" &&
			sudo apt install zsh -y &&
			sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" &&
			echo -e "$green Setting as Default SHELL! $close_color" &&
			chsh -s /bin/zsh &&
			echo -e "$green ZSH successfully installed $close_color"
			echo -e "$green You need to reboot the system to use! $close_color";;



		16)
			echo -e "$green Adding PPA $close_color" &&
			sudo add-apt-repository ppa:openjdk-r/ppa -y && 
			echo -e "$green Updating... $close_color" &&
			sudo apt update &&
			echo -e "$green Installing... $close_color" &&
			sudo apt install openjdk-8-jdk -y &&
			echo -e "$green Open Jdk successfully installed $close_color";;



		17)
			echo -e "$green Removing old version $close_color"
			sudo apt remove -y docker docker-engine docker.io containerd runc &&
			echo -e "$green Setting up environment! $close_color"
			sudo apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common &&
			echo -e "$green Installing... $close_color"
			curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - &&
			sudo apt install -y docker-ce docker-ce-cli containerd.io &&
			sudo apt update &&
			sudo groupadd docker &&
			sudo usermod -aG docker $USER &&
			echo -e "$green Docker successfully installed $close_color";;    

		0)
			echo -e "\033[0; bye... $close_color"
			exit;;


		*)
			echo -e "$red ✗ ERROR: $close_color Please enter a valid option!";;
	esac
	done
done

