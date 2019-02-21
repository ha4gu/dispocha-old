# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem 'rails',        '5.2.2'
gem 'bootsnap',     '1.3.2'
gem 'puma',         '3.12.0'
# gem 'sass-rails',   '5.0.7'
gem 'sassc-rails',  '2.1.0'
gem 'uglifier',     '4.1.20'
gem 'jquery-rails', '4.3.3'
gem 'jbuilder',     '2.8.0'
gem 'bootstrap',    '4.2.1'
gem 'devise',       '4.5.0'
gem 'devise-i18n',  '1.7.1'

group :development, :test do
  gem 'sqlite3',      '1.3.13'
  gem 'byebug',       '10.0.2', platform: :mri
  gem 'faker',        '1.9.1'
  gem 'dotenv-rails', '2.6.0'
end

group :development do
  gem 'web-console',           '3.7.0'
  gem 'listen',                '3.1.5'
  gem 'spring',                '2.0.2'
  gem 'spring-watcher-listen', '2.0.1'
end

group :test do
  gem 'rails-controller-testing', '1.0.4'
  gem 'minitest',                 '5.11.3'
  gem 'minitest-reporters',       '1.3.5'
end

group :production do
  gem 'pg', '1.1.3'
end
