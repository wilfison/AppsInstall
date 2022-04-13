#!/bin/bash

source $APPINST_BASEDIR/components/helpers/colors.sh
BASEDIR=$("$APPINST_BASEDIR/components")

# check if prev instaled
if which -a "code"; then
  echo -e "$green VS Code já instalado! $close_color"
else
  echo -e "$green Installing Access Key! $close_color" &&
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >microsoft.gpg &&
    sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg &&
    sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' &&
    echo -e "$green Updating... $close_color" &&
    sudo apt update &&
    echo -e "$green Installing VS Code $close_color" &&
    sudo apt install code -y
fi

echo -ne "$blue Do you want to install Custom Extensions? [y:n] $close_color" &&
  read add_extensions

# if user press Yes
if [ "$add_extensions" = 'y' ]; then
  echo -e "$green Installing VS Code Extensions... $close_color"

  echo -e "$blue Installing Fira Code Font $close_color"
  sudo apt install -y fonts-firacode

  echo -e "$blue One Dark Dracula $close_color"
  git clone https://github.com/Wilfison/one-dark-dracula.git ~/.vscode/extensions

  echo -e "$blue One Dark theme for Visual Studio Code $close_color"
  code --install-extension zhuangtongfa.material-theme

  echo -e "$blue HTML/XML close tag $close_color"
  code --install-extension formulahendry.auto-close-tag

  echo -e "$blue VSCode syntax highlighting for JavaScript $close_color"
  code --install-extension mgmcdermott.vscode-language-babel

  echo -e "$blue Haml syntax highlighting $close_color"
  code --install-extension karunamurti.haml

  echo -e "$blue Highlight web colors$close_color"
  code --install-extension naumovs.color-highlight

  echo -e "$blue Support for dotenv file syntax $close_color"
  code --install-extension mikestead.dotenv

  echo -e "$blue EditorConfig Support for Visual Studio Code $close_color"
  code --install-extension editorconfig.editorconfig

  echo -e "$blue Simple extensions for React, Redux and Graphql $close_color"
  code --install-extension dsznajder.es7-react-js-snippets

  echo -e "$blue Integrates ESLint JavaScript into VS Code. $close_color"
  code --install-extension dbaeumer.vscode-eslint

  echo -e "$blue File Utils $close_color"
  code --install-extension sleistner.vscode-fileutils

  echo -e "$blue GitLens $close_color"
  code --install-extension eamodio.gitlens

  echo -e "$blue Code snippets for JavaScript in ES6 syntax $close_color"
  code --install-extension xabikos.javascriptsnippets

  echo -e "$blue Material Design Icons for Visual Studio Code $close_color"
  code --install-extension pkief.material-icon-theme

  echo -e "$blue A rainbow brackets extension for VS Code. $close_color"
  code --install-extension 2gua.rainbow-brackets

  echo -e "$blue Adds support for Ruby colorization to Visual Studio Code $close_color"
  code --install-extension groksrc.ruby

  echo -e "$blue Rails - 10K+ snippets $close_color"
  code --install-extension hridoy.rails-snippets

  echo -e "$blue Ruby Solargraph $close_color"
  code --install-extension castwide.solargraph

  echo -e "$blue Smart Column Indenter $close_color"
  code --install-extension lmcarreiro.vscode-smart-column-indenter

  echo -e "$blue Sass syntax Highlighting $close_color"
  code --install-extension syler.sass-indented

  echo -e "$blue Auto Add Brackets in String Interpolation $close_color"
  code --install-extension aliariff.auto-add-brackets

  echo -e "$blue Updating VS Code Settings... $close_color"
  rm $HOME/.config/Code/User/settings.json
  cp $BASEDIR/config/vscode_settings.json $HOME/.config/Code/User/settings.json
fi

echo -e "$green VS Code successfully installed $close_color"
