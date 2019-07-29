#!/bin/bash

BASEDIR=$(readlink -f .)
source $BASEDIR/components/helpers/colors.sh
source $BASEDIR/components/helpers/profile.sh

while true; do

echo -e "$blue
 =======================================================================
 |                   What are we going to install now?                 |
 =======================================================================
$close_color
$green Development: $close_color
 
$green  1 $close_color ➜ $blue RVM + Rails + PostgreSql $close_color |    $green  2 $close_color ➜ $blue React Native CLI  $close_color
$green  3 $close_color ➜ $blue Git $close_color                      |    $green  4 $close_color ➜ $blue Electron  $close_color
$green  5 $close_color ➜ $blue NVM $close_color                      |    $green  6 $close_color ➜ $blue Ionic  $close_color
$green  7 $close_color ➜ $blue Nodejs $close_color                   |    $green  8 $close_color ➜ $blue My ZSH  $close_color
$green  9 $close_color ➜ $blue Visual Code $close_color              |    $green 10 $close_color ➜ $blue Open Jdk 8  $close_color
$green 11 $close_color ➜ $blue Docker  $close_color
																																		
$green Tools and others: $close_color														
																																		
$green 50 $close_color ➜ $blue Google Chrome $close_color           
$green 51 $close_color ➜ $blue Telegram $close_color                
$green 52 $close_color ➜ $blue Codecs and Extras $close_color
																																		
		               0 ➜ Sair  																				
$blue
 ====================== Created by Wilfison Batista ===================== $close_color
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

		2) bash $BASEDIR/components/react_native.sh;;

		3) bash $BASEDIR/components/git.sh;;

		4) bash $BASEDIR/components/electron.sh;;

		5) bash $BASEDIR/components/nvm.sh;;

		6) bash $BASEDIR/components/ionic.sh;;

		7) bash $BASEDIR/components/node.sh;;

		8) bash $BASEDIR/components/zsh.sh;;

		9) bash $BASEDIR/components/vscode.sh;;

		10) bash $BASEDIR/components/jdk.sh;;

		11) bash $BASEDIR/components/docker.sh;;

		50) bash $BASEDIR/components/chrome.sh;;

		51) bash $BASEDIR/components/telegram.sh;;

		52) bash $BASEDIR/components/extras.sh;;

		0) echo -e "$green bye... $close_color" && exit;;

		*) echo -e "$red ✗ ERROR: $close_color$green Please enter a valid option! $close_color";;
	esac
	done
done

