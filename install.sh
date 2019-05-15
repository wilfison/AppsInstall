#!/bin/bash

green="\033[0;32m"
blue="\033[0;34m"
close_color="\033[0m"

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
echo -e "Agora procure por App Install no seu menu de Aplicativos ou execute$blue appinstall$close_color no seu terminal"