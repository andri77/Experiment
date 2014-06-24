require 'uri'
require 'net/http'

#CAPYBARA

require 'capybara/cucumber'
require 'capybara/session'

#Standard profiling:
#Capybara.register_driver :chrome do |app|
#  Capybara::Selenium::Driver.new(app, :browser => :chrome)
#  end
#
#  Capybara.javascript_driver = :chrome

#standard useragent profiling:
#Capybara.register_driver :chrome do |app|
#  #require 'selenium/webdriver'
#  #profile = Selenium::WebDriver::Firefox::Profile.new
#  #profile['general.useragent.override'] = "iPhone
#  Capybara::Selenium::Driver.new(app, :browser => :chrome)
#end

$brw = ENV['BROWSER']
case $brw
  when "ff"
    # require 'capybara/firebug'
    # require 'capybara/firebug/cucumber'
   Capybara.configure do |config|
      config.default_driver = :selenium
      #config.run_server = false
      config.default_selector = :css
      config.default_wait_time = 20
   end
   Capybara.page.driver.browser.manage.window.maximize
   Capybara.register_driver :selenium do |app|
   profile = Selenium::WebDriver::Firefox::Profile.new
  Capybara::Selenium::Driver.new(app, :browser => :firefox, :profile => profile)
   end

when "chrome"
  require 'selenium-webdriver'
 puts "BROWSER = "+ENV['BROWSER']
  Capybara.register_driver :chrome do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
  end
  Capybara.default_driver = :chrome
  Capybara.default_wait_time = 15
  Capybara.default_selector = :css
  Capybara.page.driver.browser.manage.window.maximize

when "ie"
   puts "BROWSER = "+ENV['BROWSER']
   Capybara.register_driver :selenium_ie do |app|
     Capybara::Selenium::Driver.new(app, :browser => :ie)
   end
   Capybara.default_driver = :selenium_ie
   Capybara.default_wait_time = 15
   Capybara.page.driver.browser.manage.window.maximize

else
Capybara.configure do |config|
      config.default_driver = :selenium
      #config.run_server = false
      config.default_selector = :css
      config.default_wait_time = 30
end
   Capybara.page.driver.browser.manage.window.maximize
   Capybara.register_driver :selenium do |app|
   profile = Selenium::WebDriver::Firefox::Profile.new
  Capybara::Selenium::Driver.new(app, :browser => :firefox, :profile => profile)
   end
end

require File.dirname(__FILE__) + '/lib/configuration';
BASE_URL = Configuration["base_url"]
$base_url = BASE_URL
