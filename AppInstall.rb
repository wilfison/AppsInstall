#!/usr/bin/env ruby

# frozen_string_literal: true

require 'tty-prompt'

prompt = TTY::Prompt.new

selecteds = prompt.multi_select('What are we going to install now?') do |menu|
  menu.choice 'Chrome',                                     :chrome
  menu.choice 'Docker',                                     :docker
  menu.choice 'Extras (codecs, decompressors, etc)',        :extras
  menu.choice 'Git',                                        :git
  menu.choice 'Node',                                       :node
  menu.choice 'NVM (Node Version Manager)',                 :nvm
  menu.choice 'Add Custom Aliases',                         :personal_config
  menu.choice 'RVM + Ruby on Rails',                        :rails_rvm
  menu.choice 'Rails Template (Rails project Boilerplate)', :rails_template
  menu.choice 'React Native',                               :react_native
  menu.choice 'Telegram Desktop',                           :telegram
  menu.choice 'Vscode',                                     :vscode
  menu.choice 'Zsh',                                        :zsh
  menu.choice 'Add Vscode default settings to a project',   :vscode_config_project
  menu.choice 'Update AppInstall',                          :update
end

raise StandardError, 'Error! Select at least one option' if selecteds.size.zero?

cmd = ''

selecteds.each do |selected|
  cmd += " && bash components/#{selected}.sh"
end

system "cd #{Dir.pwd} #{cmd}"
