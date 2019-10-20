#!/bin/bash

source $HOME/.local/share/AppInstall/components/helpers/colors.sh
BASEDIR=$HOME/.local/share/AppInstall/components

echo -e "$green Installing Access Key! $close_color" &&
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg &&
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg &&
sudo sh -c 'echo -e "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' &&

echo -e "$green Updating... $close_color" &&
sudo apt update &&

echo -e "$green Installing VS Code $close_color" &&
sudo apt install code -y &&

add_extensions=$(dialog --title "Extensions" --yesno "Do you want to install Custom Extensions?" 8 60 2>&1 >/dev/tty)

# if user press Yes
if [ $? = 0 ]; then
  echo -e "$green Installing VS Code Extensions... $close_color"
  
  echo -e "$green Installing Fira Code Font $close_color"
  sudo apt install fonts-firacode
  
  echo -e "$green One Dark theme for Visual Studio Code $close_color"
  code --install-extension zhuangtongfa.material-theme
  
  echo -e "$green HTML/XML close tag $close_color"
  code --install-extension formulahendry.auto-close-tag

  echo -e "$green VSCode syntax highlighting for JavaScript $close_color"
  code --install-extension mgmcdermott.vscode-language-babel

  echo -e "$green Haml syntax highlighting $close_color"
  code --install-extension karunamurti.haml

  echo -e "$green Highlight web colors$close_color"
  code --install-extension naumovs.color-highlight

  echo -e "$green Support for dotenv file syntax $close_color"
  code --install-extension mikestead.dotenv

  echo -e "$green EditorConfig Support for Visual Studio Code $close_color"
  code --install-extension editorconfig.editorconfig

  echo -e "$green Simple extensions for React, Redux and Graphql $close_color"
  code --install-extension dsznajder.es7-react-js-snippets

  echo -e "$green Integrates ESLint JavaScript into VS Code. $close_color"
  code --install-extension dbaeumer.vscode-eslint

  echo -e "$green File Utils $close_color"
  code --install-extension sleistner.vscode-fileutils

  echo -e "$green GitLens $close_color"
  code --install-extension eamodio.gitlens

  echo -e "$green Code snippets for JavaScript in ES6 syntax $close_color"
  code --install-extension xabikos.javascriptsnippets

  echo -e "$green Material Design Icons for Visual Studio Code $close_color"
  code --install-extension pkief.material-icon-theme

  echo -e "$green A rainbow brackets extension for VS Code. $close_color"
  code --install-extension 2gua.rainbow-brackets

  echo -e "$green Adds support for Ruby colorization to Visual Studio Code $close_color"
  code --install-extension groksrc.ruby

  echo -e "$green Rails - 10K+ snippets $close_color"
  code --install-extension hridoy.rails-snippets

  echo -e "$green Sass syntax Highlighting $close_color"
  code --install-extension syler.sass-indented

  echo -e "$green Updating VS Code Settings... $close_color"
  rm $HOME/.config/Code/User/settings.json
  cp $BASEDIR/config/settings.json $HOME/.config/Code/User/settings.json
fi

echo -e "$green VS Code successfully installed $close_color"