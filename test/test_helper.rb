require 'coveralls'
Coveralls.wear_merged!

require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
# require "webmock/minitest"
require 'database_cleaner'

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

# Uncomment for awesome colorful output
# require "minitest/pride"

DatabaseCleaner.strategy = :truncation

class ActionController::TestCase
  include Devise::TestHelpers
end

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods

  before :each do
    DatabaseCleaner.start
  end

  after :each do
    DatabaseCleaner.clean
  end

  # Add more helper methods to be used by all tests here...

end
