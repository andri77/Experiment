# require 'selenium-webdriver'
#
# Given /^I use selenium webdriver method in$/ do
#   @driver = Selenium::WebDriver.for :firefox
#   # @driver = Selenium::WebDriver.for $brw.to_sym #take $brw from env.rb for multi browser testing + capybara/selenium integration
#   @driver.manage.window.resize_to(1200, 800)
# analyze
#   @driver.get url
#
# end