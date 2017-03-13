source 'https://rubygems.org'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
ruby '2.3.3'
gem 'rails', '~> 5.0.1'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
group :development, :test do
  gem 'byebug', platform: :mri
end
group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'administrate'
gem 'bootstrap-sass'
gem 'bourbon'
gem 'devise'
gem 'devise-i18n'
gem 'high_voltage'
gem 'simple_form'
gem 'therubyracer', :platform=>:ruby
group :development do
  gem 'better_errors'
  gem 'foreman'
  gem 'rails_layout'
end
group :development, :test do
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'sqlite3'
end
group  :production do
  gem 'pg'
  gem 'thin'
end
gem 'pg'
gem "cocoon"
gem "chartkick"
gem 'groupdate'
gem "prawn"
gem 'prawn-rails'
gem 'jquery-datatables'