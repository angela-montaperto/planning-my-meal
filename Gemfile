source "https://rubygems.org"

ruby "3.3.5"
gem "rails", "~> 8.0"
gem "sprockets-rails"
gem "mysql2"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false
gem "devise"
gem "sassc-rails"
gem "jquery-rails"

gem "config"
gem "pundit"
gem "ransack"
gem "kaminari"
# gem 'recaptcha'
gem "bootstrap"
gem "audited"

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "bundler-audit"
  gem "rubocop-rails-omakase", require: false
  gem "rspec-rails", "~> 7.0", ">= 7.0.1"
  gem "factory_bot_rails"
  gem "faker"
  gem "timecop", require: false
end

group :development do
  gem "web-console"
  gem "letter_opener"
  gem "letter_opener_web"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webmock"
  gem "vcr"
  gem "shoulda-matchers", "~> 6.0"
  gem "simplecov", require: false
end
