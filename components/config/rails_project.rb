# This config file is based on https://github.com/lewagon/rails-templates

run 'pgrep spring | xargs kill -9'

# GEMFILE
########################################
run 'rm Gemfile'
file 'Gemfile', <<-RUBY
source 'https://rubygems.org'

ruby '#{RUBY_VERSION}'

gem 'rails', '#{Rails.version}'
gem 'rails-i18n', '~> 5.1'

# uncomment your database and run 'bundle install'
# gem 'activerecord-sqlserver-adapter', '~> 5.1', '>= 5.1.6'
# gem 'pg'

gem 'puma', '~> 3.7'

gem 'bootstrap', '~> 4.1.0'
gem 'font-awesome-sass', '~> 5.3.1'
gem 'jquery-rails'
gem 'webpacker', '~> 4.0.7'

gem "bootstrap4-kaminari-views"
gem "kaminari"
gem "kaminari-i18n"

gem 'haml'
gem 'sass-rails'
gem 'simple_form'
gem 'uglifier'

gem 'coffee-rails'
gem 'jbuilder'

gem "ransack", github: "activerecord-hackery/ransack"

gem 'pundit'
gem "faker"
gem 'virtus'

gem 'bootsnap'
gem 'mini_magick'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails'
  gem "pry-rails"
  gem 'dotenv-rails'
  gem 'rspec-rails', '~> 3.7'
  gem 'rspec_junit_formatter'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'yaml_db'
end

group :test do
  gem 'simplecov'
  gem 'simplecov-rcov'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem "better_errors"
  gem "binding_of_caller"
  gem 'rails-erd'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

RUBY

# Ruby version
########################################
file '.ruby-version', RUBY_VERSION

# Procfile
########################################
file 'Procfile', <<-YAML
web: bundle exec puma -C config/puma.rb
YAML

# Assets
########################################
run 'rm -rf app/assets/stylesheets'
run 'rm -rf vendor'
run 'curl -L https://github.com/lewagon/stylesheets/archive/master.zip > stylesheets.zip'
run 'unzip stylesheets.zip -d app/assets && rm stylesheets.zip && mv app/assets/rails-stylesheets-master app/assets/stylesheets'

run 'rm app/assets/javascripts/application.js'
file 'app/assets/javascripts/application.js', <<-JS
//= require jquery3
//= require bootstrap
//= require_tree .
JS

# Dev environment
########################################
gsub_file('config/environments/development.rb', /config\.assets\.debug.*/, 'config.assets.debug = false')

# Layout
########################################
run 'rm app/views/layouts/application.html.erb'
file 'app/views/layouts/application.html.haml', <<-HAML
!!!
%html
  %head
    %meta{:charset => "UTF-8"}
    %meta{:content => "width=device-width, initial-scale=1.0", :name => "viewport"}
    %meta{:content => "ie=edge", "http-equiv" => "X-UA-Compatible"}

    %meta{:content => "My App", :name => "apple-mobile-web-app-title"}
    %meta{:content => "My App", :name => "application-name"}
    %meta{:content => "#0078d6", :name => "msapplication-TileColor"}
    %meta{:content => "#ffffff", :name => "theme-color"}
    
    -# = favicon_link_tag "favicons/apple-touch-icon.png", rel: "apple-touch-icon", sizes: "180x180"
    -# = favicon_link_tag "favicons/favicon-32x32.png", rel: "icon", sizes: "32x32", type: "image/png"
    -# = favicon_link_tag "favicons/favicon-16x16.png", rel: "icon", sizes: "16x16", type: "image/png"
    -# = favicon_link_tag "favicons/site.webmanifest", rel: "manifest"
    -# = favicon_link_tag "favicons/safari-pinned-tab.svg", rel: "mask-icon", color: "#5bbad5"
    
    %title= content_for?(:title) ? "My App - #{ yield(:title) }" : "My App"
    
    = csrf_meta_tags
    = stylesheet_link_tag "application", media: 'all'
    

  %body
    .container-fluid.body-content
      .page-head
        %h2.page-head-title
          = yield(:title)
      
      = yield

    = javascript_include_tag "application"
HAML

# README
########################################
markdown_file_content = <<-MARKDOWN
#### Rails app generated with [wilfison/AppsInstall](https://github.com/wilfison/AppsInstall).
MARKDOWN
file 'README.md', markdown_file_content, force: true

# Generators
########################################
generators = <<-RUBY
config.generators do |generate|
      generate.assets false
      generate.helper false
      generate.test_framework  :test_unit, fixture: false
    end
RUBY

environment generators

########################################
# AFTER BUNDLE
########################################
after_bundle do
  # Generators: db + simple form + pages controller
  ########################################
  rails_command 'db:drop db:create db:migrate'
  generate('simple_form:install', '--bootstrap')
  generate(:controller, 'pages', 'home', '--skip-routes', '--no-test-framework')

  # Routes
  ########################################
  route "root to: 'pages#home'"

  # Git ignore
  ########################################
  run 'rm .gitignore'
  file '.gitignore', <<-TXT
.bundle
log/*.log
tmp/**/*
tmp/*
!log/.keep
!tmp/.keep
*.swp
.DS_Store
public/assets
public/packs
public/packs-test
node_modules
yarn-error.log
.byebug_history
TXT


  # Dotenv
  ########################################
  run 'touch .env'

  # Rubocop
  ########################################
  run 'curl -L https://raw.githubusercontent.com/lewagon/rails-templates/master/.rubocop.yml > .rubocop.yml'

  # Git
  ########################################
  git :init
  git add: '.'
  git commit: "-m 'Initial commit with template from https://github.com/wilfison/AppsInstall'"
end