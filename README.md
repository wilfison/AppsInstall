# AppsInstall
## Mini Aplicativo para prepar ambientes de programação e instalar alguns softwares no Ubuntu e derivados.


![ScreenShot do App](https://github.com/Wilfison/AppsInstall/raw/master/screenshot.png)


## Instalação:


1. Faça o download do arquivo clicando <a href="https://github.com/Wilfison/AppsInstall/archive/master.zip">aqui.</a>
2. Descompacte o arquivo ZIP.
3. Execute <code>install.sh</code> clicando duas vezes no arquivo ou abra um terminal na pasta e digite:


    $ sudo sh install.sh

4. Se você apenas deseja instalar um programa digite 1.
5. Se você deseja instalar outros apps recomendamos que use as opções 2 ou 3 e instale no seu pc, você poderá escontrar o App Install no seu menu de aplicativos.

## Instalar Apps


1. Execute AppInstall no seu menu de aplicativos ou <code>$ appinstall</code> em um terminal (caso tenha instalado) ou use o comando abaixo:

    $ sh -c "$(wget https://raw.githubusercontent.com/Wilfison/AppsInstall/master/AppInstall.sh -O -)"

2. Escolha qual programa deseja instalar, digite o número correspondente e precione enter
3. Aguarde o fim da instalação e confirmação da instalação com sucesso
4. Escolha outro software a ser instalado ou tecle 0 para sair

##  Atenção


### Alguns programas não podem ser adicionados ao debian por usar PPA's:

- Libre Office
- Deepin Desktop 
- Open Jdk 8
- Wine
