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
    require 'selenium-webdriver'
    caps = Selenium::WebDriver::Remote::Capabilities.firefox("firefoxOptions" => {"args" => [ "--allow-running-insecure-content" ]}) #"--disable-web-security",
   Capybara.configure do |config|
      config.default_driver = :selenium
      config.default_selector = :css
      config.default_wait_time = 10
   end
   Capybara.page.driver.browser.manage.window.maximize
   Capybara.register_driver :selenium do |app|
   profile = Selenium::WebDriver::Firefox::Profile.new
  Capybara::Selenium::Driver.new(app, :browser => :firefox, :profile => profile, :desired_capabilities => caps)
   end

when "chrome"
  require 'selenium-webdriver'
 puts "BROWSER = "+ENV['BROWSER']
  caps = Selenium::WebDriver::Remote::Capabilities.chrome("chromeOptions" => {"args" => [ "--allow-running-insecure-content" ]}) #"--disable-web-security",
  Capybara.register_driver :chrome do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome, :desired_capabilities => caps)
  end
  Capybara.default_driver = :chrome
  Capybara.default_wait_time = 10
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

  when "grid-firefox"
  require 'selenium-webdriver'
  # driver = Selenium::WebDriver.for(:remote, :url => "http://127.0.0.1:5555/wd/hub", :desired_capabilities => :firefox)
  caps = Selenium::WebDriver::Remote::Capabilities.firefox("firefoxOptions" => {"args" => [ "--allow-running-insecure-content" ]})
  Capybara.default_driver = :selenium
  Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app,
                                   :browser => :remote,
                                   :url => "http://127.0.0.1:5555/wd/hub",
                                   :desired_capabilities => caps)
  end

  when "grid-chrome"
    require 'selenium-webdriver'
    # driver = Selenium::WebDriver.for(:remote, :url => "http://127.0.0.1:5555/wd/hub", :desired_capabilities => :firefox)
    caps = Selenium::WebDriver::Remote::Capabilities.chrome("chromeOptions" => {"args" => [ "--allow-running-insecure-content" ]})
    Capybara.default_driver = :selenium
    Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(app,
                                     :browser => :remote,
                                     :url => "http://127.0.0.1:8989/wd/hub",
                                     :desired_capabilities => caps)
    end

  when "grid-ie"
    require 'selenium-webdriver'
    # driver = Selenium::WebDriver.for(:remote, :url => "http://127.0.0.1:5555/wd/hub", :desired_capabilities => :firefox)
    caps = Selenium::WebDriver::Remote::Capabilities.ie
    Capybara.default_driver = :selenium
    Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(app,
                                     :browser => :remote,
                                     :url => "http://127.0.0.1:9999/wd/hub",
                                     :desired_capabilities => caps)
    end

else
Capybara.configure do |config|
      config.default_driver = :selenium
      #config.run_server = false
      config.default_selector = :css
      config.default_wait_time = 10
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
