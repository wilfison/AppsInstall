#!/bin/bash

blue="\033[0;34m"
red="\033[0;32m"
green="\033[0;31m"


clear
while true; do
echo -e "\033[0;34m 
 =================================================================== \033[0m $green
                         O que vamos Fazer? \033[0m

$blue 
      
      1 - Executar agora             |    0 - Sair
      2 - Instalar no PC (Português) |
      3 - Instalar no PC (Inglês)    |

\033[0m
$red  
          Obs: se você Instalar o App no PC poderá encontra-lo 
                        no seu menu de aplicativos. 
\033[0m

$blue
 =================== Criado por Wilfison Batista ===================  \033[0m

"

echo -e "$blue Digite um número da sua opção: \033[0m
"
echo -n -e "$blue ->OPÇÃO:\033[0m "

read opcao

#verificar se foi digitada uma opcao
if [ -z $opcao ]; then
    echo "ERRO: digite uma opcao"
    exit
fi

case $opcao in
    1)
        sudo sh AppInstall.sh;;
    2)
	rm -rf ~/.local/share/AppInstall &&
	rm -rf ~/.local/share/applications/AppInstall.desktop &&        
	mkdir ~/.local/share/AppInstall &&
        cp AppInstall.sh ~/.local/share/AppInstall &&
        cp AppInstall.desktop ~/.local/share/applications &&
	cp AppInstall.svg ~/.local/share/AppInstall &&
	rm -rf ~/Área\ de\ Trabalho/AppInstall.desktop &&
        ln -s ~/.local/share/applications/AppInstall.desktop ~/Área\ de\ Trabalho/ &&
        clear
        echo -e "\033[0;31m 
	Agora procure por App Install no seu menu de Aplicativos 
	   nós também adicionamos um atalho no seu desktop \033[0m";;
    3)
        rm -rf ~/.local/share/AppInstall &&
	rm -rf ~/.local/share/applications/AppInstall.desktop &&        
	mkdir ~/.local/share/AppInstall &&
        cp AppInstall.sh ~/.local/share/AppInstall &&
        chmod +x AppInstall.desktop &&
	cp AppInstall.svg ~/.local/share/AppInstall &&
	rm -rf ~/Desktop/AppInstall.desktop
        ln -s ~/.local/share/applications/AppInstall.desktop ~/Desktop
        clear
        echo -e "\033[0;31m 
	Agora procure por App Install no seu menu de Aplicativos 
	   nós também adicionamos um atalho no seu desktop \033[0m";; 
    0)
        echo -e "\033[0;31m Saindo... \033[0m"
        exit;;
    *)
        echo
        echo -e "\033[0;31m ERRO: opção inválida \033[0m"
        echo ;;
esac
done
