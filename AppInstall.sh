#!/bin/bash

BASEDIR="$HOME/.local/share/AppInstall/components"
source $BASEDIR/helpers/colors.sh
source $BASEDIR/helpers/profile.sh

# set personal configs
if [ "$1" == '-d' ]; then
	bash $BASEDIR/personal_config.sh
fi

options=$(
	dialog --stdout --separate-output --no-shadow --checklist 'What are we going to install now?' 23 100 100 \
		1 "RVM + Rails + PostgreSql" off \
		2 "New Rails Project with Template" off \
		3 "Visual Code" off \
		4 "React Native CLI" off \
		5 "Git" off \
		7 "NVM" off \
		9 "Nodejs" off \
		10 "My ZSH " off \
		11 "Docker" off \
		50 "Google Chrome" off \
		51 "Telegram" off \
		52 "Codecs and Extras" off \
		53 "Set VSCode configs" off \
		54 "Update AppInstall" off
)

# check if an option has been entered
if [ $? -eq 1 ]; then
	clear &&
		echo -e "$green \n \n BYE :) \n \n $close_color" &&
		exit 1
fi

echo -e $options | while read OPTION; do
	case $OPTION in
	1) bash $BASEDIR/rails_rvm.sh && echo 'OK';;

	2) bash $BASEDIR/rails_template.sh && echo 'OK';;

	3) bash $BASEDIR/vscode.sh && echo 'OK';;

	4) bash $BASEDIR/react_native.sh && echo 'OK';;

	5) bash $BASEDIR/git.sh && echo 'OK';;

	7) bash $BASEDIR/nvm.sh && echo 'OK';;

	9) bash $BASEDIR/node.sh && echo 'OK';;

	10) bash $BASEDIR/zsh.sh && echo 'OK';;

	11) bash $BASEDIR/docker.sh && echo 'OK';;

	50) bash $BASEDIR/chrome.sh && echo 'OK';;

	51) bash $BASEDIR/telegram.sh && echo 'OK';;

	52) bash $BASEDIR/extras.sh && echo 'OK';;

	53) bash $BASEDIR/vscode_config_project.sh && echo 'OK';;

	54) bash $BASEDIR/update.sh && echo 'OK';;

	*) echo -e "$red ✗ ERROR: '$OPTION' is not a valid option!" ;;
	esac
done
