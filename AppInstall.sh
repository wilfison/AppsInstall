#!/bin/bash

BASEDIR=$(readlink -f .)
source $BASEDIR/components/helpers/colors.sh
source $BASEDIR/components/helpers/profile.sh

while true; do

echo -e "$blue
 =====================================================================================
 |                         What are we going to install now?                         |
 ===================================================================================== $close_color

$green Development: $close_color

  1 ➜ $blue RVM + Rails + PostgreSql $close_color      2 ➜ $blue New Rails Project with Template $close_color
  3 ➜ $blue Visual Code $close_color                   4 ➜ $blue React Native CLI $close_color
  5 ➜ $blue Git $close_color                           6 ➜ $blue Electron  $close_color
  7 ➜ $blue NVM $close_color                           8 ➜ $blue Ionic  $close_color
  9 ➜ $blue Nodejs $close_color                       10 ➜ $blue My ZSH  $close_color
 11 ➜ $blue Docker  $close_color

$green Tools and others: $close_color										
																																		
 50 ➜ $blue Google Chrome $close_color           
 51 ➜ $blue Telegram $close_color                
 52 ➜ $blue Codecs and Extras $close_color

$blue
 ============================ Created by Wilfison Batista =========================== $close_color
"
echo -e "$green Enter the number of components to install by comma-separated: $close_color"

echo -e -n "$green \n\r ➜$close_color "

read option

# check if an option has been entered
if [ -z $option ]; then
	echo -e "$red ✗ ERROR: $close_color Please enter a valid option!"
	exit 1;
fi

# splitter inputs
options=$(echo $option | tr "," " ")

for addr in $options
do
	case $addr in
		1) bash $BASEDIR/components/rails_rvm.sh;;

		2) bash $BASEDIR/components/rails_template.sh;;

		3) bash $BASEDIR/components/vscode.sh;;

		4) bash $BASEDIR/components/react_native.sh;;

		5) bash $BASEDIR/components/git.sh;;

		6) bash $BASEDIR/components/electron.sh;;

		7) bash $BASEDIR/components/nvm.sh;;

		8) bash $BASEDIR/components/ionic.sh;;

		9) bash $BASEDIR/components/node.sh;;

		10) bash $BASEDIR/components/zsh.sh;;

		11) bash $BASEDIR/components/docker.sh;;

		50) bash $BASEDIR/components/chrome.sh;;

		51) bash $BASEDIR/components/telegram.sh;;

		52) bash $BASEDIR/components/extras.sh;;

		0) echo -e "$green bye... $close_color" && exit;;

		*) echo -e "$red ✗ ERROR: $close_color$green Please enter a valid option! $close_color";;
	esac
	done
done

