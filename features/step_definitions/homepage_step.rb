#!/usr/bin/ruby

# require 'D:\projects\RubySpike\features\step_definitions\pages\Home_Page.rb'
require '.\features\step_definitions\pages\Home_Page.rb'

# HOME = Home_Page.new

Given /^I am on Portplus homepage 2$/ do
#if(page.driver.browser.browser.to_s == "internet_explorer")
  page.driver.browser.manage.window.maximize
  #begin
  #Selenium::WebDriver::Error:UnhandledAlertError
  #page.driver.wait_until.e
  #page.driver.browser.switch_to.alert.dismiss
  #end
#end
  visit $base_url
end

Given /^I am on Portplus homepage$/ do
  page.driver.browser.manage.window.maximize
  Home_Page.visit_page $base_url
  Home_Page.check_title
end

When /^I fill in my user name as "(.*?)"$/ do |userName|
  Home_Page.fill_in_username userName
end

When /^I fill in my password as "(.*?)"$/ do |password|
  Home_Page.fill_in_password password
end

  When /^I click login button$/ do
    Home_Page.click_login
    end

When /^I should be directed to the login page$/ do
  page.driver.wait_until { page.current_url.should include 'cHelpdesk.controlpanel' }
end


#require 'debugger'
#  debugger
#  1


