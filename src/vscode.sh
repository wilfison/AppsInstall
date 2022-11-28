#!/bin/bash

source $APPINST_BASEDIR/src/helpers/colors.sh
BASEDIR="$APPINST_BASEDIR/src"

# check if prev instaled
if which -a "code"; then
  show_info_log "VS Code already installed!"
else
  show_info_log "Installing Access Key!" &&
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >microsoft.gpg &&
    sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg &&
    sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' &&
    show_info_log "Updating..." &&
    sudo apt update &&
    show_info_log "Installing VS Code" &&
    sudo apt install code -y
fi

show_info_input "Do you want to install Custom Extensions? [y:n]" && read add_extensions

# if user press Yes
if [ "$add_extensions" = 'y' ]; then
  show_info_log "Installing VS Code Extensions..."

  show_info_log "Installing Fira Code Font"
  sudo apt install -y fonts-firacode

  show_info_log "One Dark Dracula"
  git clone https://github.com/Wilfison/one-dark-dracula.git $HOME/.vscode/extensions

  show_info_log "One Dark theme for Visual Studio Code"
  code --force --install-extension zhuangtongfa.material-theme

  show_info_log "HTML/XML close tag"
  code --force --install-extension formulahendry.auto-close-tag

  show_info_log "VSCode syntax highlighting for JavaScript"
  code --force --install-extension mgmcdermott.vscode-language-babel

  show_info_log "Haml syntax highlighting"
  code --force --install-extension karunamurti.haml

  show_info_log "ERB Formatter/Beautify"
  code --force --install-extension aliariff.vscode-erb-beautify

  show_info_log "Highlight web colors"
  code --force --install-extension naumovs.color-highlight

  show_info_log "Support for dotenv file syntax"
  code --force --install-extension mikestead.dotenv

  show_info_log "EditorConfig Support for Visual Studio Code"
  code --force --install-extension editorconfig.editorconfig

  show_info_log "Simple extensions for React, Redux and Graphql"
  code --force --install-extension dsznajder.es7-react-js-snippets

  show_info_log "Integrates ESLint JavaScript into VS Code."
  code --force --install-extension dbaeumer.vscode-eslint

  show_info_log "File Utils"
  code --force --install-extension sleistner.vscode-fileutils

  show_info_log "GitLens"
  code --force --install-extension eamodio.gitlens

  show_info_log "Code snippets for JavaScript in ES6 syntax"
  code --force --install-extension xabikos.javascriptsnippets

  show_info_log "Material Design Icons for Visual Studio Code"
  code --force --install-extension pkief.material-icon-theme

  show_info_log "A rainbow brackets extension for VS Code."
  code --force --install-extension 2gua.rainbow-brackets

  show_info_log "Adds support for Ruby colorization to Visual Studio Code"
  code --force --install-extension groksrc.ruby

  show_info_log "Rails - 10K+ snippets"
  code --force --install-extension hridoy.rails-snippets

  show_info_log "Ruby Solargraph"
  code --force --install-extension castwide.solargraph

  show_info_log "Smart Column Indenter"
  code --force --install-extension lmcarreiro.vscode-smart-column-indenter

  show_info_log "Sass syntax Highlighting"
  code --force --install-extension syler.sass-indented

  show_info_log "Auto Add Brackets in String Interpolation"
  code --force --install-extension aliariff.auto-add-brackets

  show_info_log "SQLTools"
  code --force --install-extension mtxr.sqltools

  show_info_log "Updating VS Code Settings..."
  rm $HOME/.config/Code/User/settings.json
  cp $BASEDIR/config/vscode_settings.json $HOME/.config/Code/User/settings.json
fi

show_success_log "VS Code successfully installed"
