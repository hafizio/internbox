source 'https://rubygems.org'

ruby '2.1.2'
gem 'rails', '4.1.1'
gem 'pg'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'devise', github: 'plataformatec/devise'
gem 'foundation-rails'

group :development do
  gem 'rails_layout'
  gem 'spring'
  gem 'jazz_hands', github: 'nixme/jazz_hands', branch: 'bring-your-own-debugger'
  gem 'pry-byebug' # gem 'pry-debugger' for < Ruby 2.0
  gem 'better_errors'
  gem 'binding_of_caller'
end

gem 'rails_12factor', group: :production
gem 'unicorn'
gem 'dotenv-deployment'
gem 'foreman'

group :development, :test do
  gem 'rspec-rails', '~> 3.0.0'
end

group :test do
  gem 'capybara'
end
