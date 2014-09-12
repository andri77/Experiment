require "rubygems"
require "selenium-webdriver"
#caps = Selenium::WebDriver::Remote::Capabilities.firefox(:url => "http://10.250.65.97:4444/wd/hub")
driver = Selenium::WebDriver.for(:remote, :url => "http://127.0.0.1:5555/wd/hub", :desired_capabilities => :firefox)

driver.get "https://www.google.co.uk"
driver.find_element(:id, "lst-ib").clear
driver.find_element(:id, "lst-ib").send_keys "selenium 2 webdriver"
driver.find_element(:xpath, "//ol[@id='rso']/li/div/span/h3/a/em[3]").click
driver.find_element(:link, "Selenium").click
driver.find_element(:id, "q").clear
driver.find_element(:id, "q").send_keys "grid2"
driver.find_element(:id, "submit").click

driver.quit