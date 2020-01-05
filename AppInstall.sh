#!/bin/bash

BASEDIR="$HOME/.local/share/AppInstall/components"
source $BASEDIR/helpers/colors.sh
source $BASEDIR/helpers/profile.sh

# set personal configs
if [ "$1" == '-d' ]; then
  bash $BASEDIR/personal_config.sh
fi

while true; do
	options=$(dialog --stdout --separate-output --no-shadow --checklist 'What are we going to install now?' 23 100 100  \
		1  "RVM + Rails + PostgreSql" 				off \
		2  "New Rails Project with Template"  off \
		3  "Visual Code"  		 								off \
		4  "React Native CLI"  								off \
		5  "Git"   						 								off \
		6  "Electron"          								off \
		7  "NVM"     													off \
		8  "Ionic"   													off \
		9  "Nodejs"  													off \
		10 "My ZSH "  												off \
		11 "Docker"   												off \
		50 "Google Chrome"										off \
		51 "Telegram"													off \
		52 "Codecs and Extras"								off \
		53 "Set VSCode configs"         			off \
		54 "Update AppInstall"								off
	)

	# check if an option has been entered
	if [ $? -eq 1 ]; then
		clear &&
		echo -e "$green \n \n BYE :) \n \n $close_color" &&
		exit 1;
	fi

	echo -e $options | while read OPTION
	do
		clear

		case $OPTION in
			1) bash $BASEDIR/rails_rvm.sh;;

			2) bash $BASEDIR/rails_template.sh;;

			3) bash $BASEDIR/vscode.sh;;

			4) bash $BASEDIR/react_native.sh;;

			5) bash $BASEDIR/git.sh;;

			6) bash $BASEDIR/electron.sh;;

			7) bash $BASEDIR/nvm.sh;;

			8) bash $BASEDIR/ionic.sh;;

			9) bash $BASEDIR/node.sh;;

			10) bash $BASEDIR/zsh.sh;;

			11) bash $BASEDIR/docker.sh;;

			50) bash $BASEDIR/chrome.sh;;

			51) bash $BASEDIR/telegram.sh;;

			52) bash $BASEDIR/extras.sh;;
			
			53) bash $BASEDIR/vscode_config_project.sh;;
			
			54) bash $BASEDIR/update.sh;;

			*) dialog --title '✗ ERROR:' --msgbox 'Please enter a valid option!' 6 40;;
		esac
	done

	dialog --title 'Success:' --msgbox 'All items successfully instaled!' 6 40
done
