# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rails'
require 'capybara/rspec'
# If you are not using ActiveRecord, you can remove this line.
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # config.before(:suite) do
  #   DatabaseCleaner.clean_with(:truncation)
  # end
  config.before(:suite) do
    Rails.cache.clear
  end
  # config.before(:each) do
  #   DatabaseCleaner.strategy = :transaction
  # end
  #
  # config.before(:each, :js => true) do
  #   DatabaseCleaner.strategy = :truncation
  # end
  #
  # config.before(:each) do
  #   DatabaseCleaner.start
  # end
  #
  # config.after(:each) do
  #   DatabaseCleaner.clean
  # end
  # config.before do
  #     Rails.application.env_config["devise.mapping"] = Devise.mappings[:user] # If using Devise
  #     Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
  # end
  #  config.include(OmniauthMacros)
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
OmniAuth.config.test_mode = true
