require 'uri'
require 'net/http'

#CAPYBARA

require 'capybara/cucumber'
require 'capybara/session'
#require 'capybara/firebug'
#require 'features/support/capybara'
#Capybara.default_driver = :selenium
Capybara.run_server = false
Capybara.default_selector = :css
Capybara.default_wait_time = 20

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

#Multi browsers using if statement:
#if (ENV['BROWSER']=="firefox")
#   puts "BROWSER = "+ENV['BROWSER']
#   Capybara.configure do |config|
#      config.default_driver = :selenium
#      #config.run_server = false
#      config.default_selector = :css
#      config.default_wait_time = 30
#    end
#   Capybara.register_driver :selenium do |app|
#   profile = Selenium::WebDriver::Firefox::Profile.new
#  Capybara::Selenium::Driver.new(app, :browser => :firefox, :profile => profile)
#end
#
#elsif(ENV['BROWSER']=="chrome")
#   puts "BROWSER = "+ENV['BROWSER']
#    Capybara.configure do |config|
#      config.default_driver = :selenium_chrome
#      #config.run_server = false
#      config.default_selector = :css
#      config.default_wait_time = 30
#    end
#   Capybara.register_driver :selenium_chrome do |app|
#   Capybara::Selenium::Driver.new(app, :browser => :chrome)
#   end
#
#   elsif(ENV['BROWSER']=="ie")
#   puts "BROWSER = "+ENV['BROWSER']
#    Capybara.configure do |config|
#      config.default_driver = :selenium_ie
#      config.default_selector = :css
#      config.default_wait_time = 30
#    end
#   Capybara.register_driver :selenium_ie do |app|
#   Capybara::Selenium::Driver.new(app, :browser => :internet_explorer)
#   end
#
#   elsif
#     #puts "BROWSER = "+ENV['BROWSER']
#   Capybara.configure do |config|
#      config.default_driver = :selenium
#      #config.run_server = false
#      config.default_selector = :css
#      config.default_wait_time = 30
#    end
#   Capybara.register_driver :selenium do |app|
#   profile = Selenium::WebDriver::Firefox::Profile.new
#  Capybara::Selenium::Driver.new(app, :browser => :firefox, :profile => profile)
#   end
#
#   end

#Multi browsers using case statement
$brw = ENV['BROWSER']
case $brw
when "firefox"
   Capybara.configure do |config|
      config.default_driver = :selenium
      #config.run_server = false
      config.default_selector = :css
      config.default_wait_time = 30
    end
   Capybara.register_driver :selenium do |app|
   profile = Selenium::WebDriver::Firefox::Profile.new
  Capybara::Selenium::Driver.new(app, :browser => :firefox, :profile => profile)
   end
when "chrome"
  require 'selenium-webdriver'
 puts "BROWSER = "+ENV['BROWSER']

    Capybara.configure do |config|
      config.default_driver = :selenium_chrome
      #config.run_server = false
      config.default_selector = :css
      config.default_wait_time = 30
    end
   Capybara.register_driver :selenium_chrome do |app|
   Capybara::Selenium::Driver.new(app, :browser => :chrome)
  #To integrate capybara with Selenium method

   end
when "ie"
   puts "BROWSER = "+ENV['BROWSER']
    Capybara.configure do |config|
      config.default_driver = :selenium_ie
      config.default_selector = :css
      config.default_wait_time = 30
    end
   Capybara.register_driver :selenium_ie do |app|
   Capybara::Selenium::Driver.new(app, :browser => :internet_explorer)
   end
when "android"
   puts "BROWSER = "+ENV['BROWSER']
    #Capybara.configure do |config|
    #  config.default_driver = :selenium_android
    #  config.default_selector = :css
    #  config.default_wait_time = 20
    #end
   Capybara.register_driver :selenium_android do |app|
   Capybara::Selenium::Driver.new(app, :browser => :android)
   # Capybara.register_driver :selenium_android do |app|
   # Capybara::Driver::Selenium.new(app, :browser => :android)
    end
Capybara.current_driver = :selenium_android
   #end
#when 7...9
#  puts "One of 7, 8, but not 9"
else
Capybara.configure do |config|
      config.default_driver = :selenium
      #config.run_server = false
      config.default_selector = :css
      config.default_wait_time = 30
    end
   Capybara.register_driver :selenium do |app|
   profile = Selenium::WebDriver::Firefox::Profile.new
  Capybara::Selenium::Driver.new(app, :browser => :firefox, :profile => profile)
   end
end
#Capybara.register_driver :selenium do |app|
#  Capybara::Selenium::Driver.new(app, :browser => :chrome)
#end

#gizmo!!
require 'gizmo'
require 'rubygems'
require 'selenium-webdriver'
#require 'mysql'


World(Gizmo::Helpers)

Gizmo.configure do |config|
  config.mixin_dir = File.dirname(__FILE__) + '/../pages'
end

#path: C:\RailsInstaller\Git\cmd;C:\RailsInstaller\Ruby1.9.3\bin;C:\Ruby193\bin;

require File.dirname(__FILE__) + '/lib/configuration';
BASE_URL = Configuration["base_url"]
$base_url = BASE_URL
