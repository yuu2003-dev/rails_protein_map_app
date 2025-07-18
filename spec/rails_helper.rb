require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'

require 'capybara/rspec'
require 'selenium/webdriver'

Selenium::WebDriver::Chrome::Service.driver_path = "/opt/homebrew/bin/chromedriver"
Selenium::WebDriver::Chrome.path = "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

Capybara.register_driver :selenium_chrome_headless do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--headless')
  options.add_argument('--disable-gpu')
  options.add_argument('--no-sandbox')
  options.add_argument('--disable-dev-shm-usage')
  options.add_argument('--window-size=1920,1080')
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.default_driver    = :selenium_chrome_headless
Capybara.javascript_driver = :selenium_chrome_headless

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.include Devise::Test::IntegrationHelpers, type: :system

  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
