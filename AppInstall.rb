#!/usr/bin/env ruby

# frozen_string_literal: true

require 'tty-prompt'

def run_scripts(script_names)
  cmd = ''

  script_names.each do |script_name|
    cmd += "&& bash components/#{script_name}.sh"
  end

  system "cd #{Dir.pwd} #{cmd}"
end

def execute
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
    menu.choice 'React Native',                               :react_native
    menu.choice 'Vscode',                                     :vscode
    menu.choice 'Zsh',                                        :zsh
    menu.choice 'FFMPEG (Latest)',                            :ffmpeg
    menu.choice 'Update AppInstall',                          :update
  end

  raise StandardError, 'Error! Select at least one option' if selecteds.size.zero?

  run_scripts(selecteds)
rescue TTY::Reader::InputInterrupt, Interrupt
  puts ''
  puts '-----> The action has been canceled'
rescue StandardError => e
  puts e
end

execute
