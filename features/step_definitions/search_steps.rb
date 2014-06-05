require 'selenium-webdriver'

#profile = Selenium::WebDriver::Firefox::Profile.new
#profile.enable_firebug
Given /^I use selenium webdriver method$/ do
#@driver = Selenium::WebDriver.for :firefox
@driver = Selenium::WebDriver.for $brw.to_sym #take $brw from env.rb for multi browser testing + capybara/selenium integration
@driver.manage.window.resize_to(1200, 800)

@driver.get "http://www.magentainteriors.com.au"

end

And /^I search for item$/ do

@wait = Selenium::WebDriver::Wait.new(:timeout => 10)

@wait.until { @driver.find_element(:class, "welcome").text.downcase.include? "welcome to magenta interiors"  }


logoimage = @driver.find_element(:xpath, "html/body/div[1]/div/div/div[1]/div[1]/h1/a/img")
src = logoimage[:src]
src.include? "logo.jpg"
#string src = logoimage.getAttribute("src")

element = @driver.find_element :name => "q"
element.send_keys "Prosper"
element.submit
end

And /^I add item to cart$/ do
puts "Page title is #{@driver.title}"



@wait.until { @driver.title.downcase.include? "search results for: 'prosper'" }

@wait.until { @driver.find_element(:class, "btn-cart") }
button = @driver.find_element(:class, "btn-cart")
@driver.action.click(button).perform
end

And /^I'm at checkout page$/ do

#url = driver.get(url)
#url == "http://www.magentainteriors.com.au/index.php/checkout/cart/"

@driver.find_element(:xpath, ".//*[@id='shopping-cart-table']/tbody/tr/td[6]/span/span").text.include? "AU$100.00"

#require 'debugger'
#  debugger
#  1
end

Then /^I update my quantity$/ do


input = @driver.find_element(:xpath, ".//*[@id='shopping-cart-table']/tbody/tr/td[5]/input")
input.send_keys "\b"
input.send_keys 5
input.submit

@driver.find_element(:xpath, ".//*[@id='shopping-cart-table']/tbody/tr/td[6]/span/span").text.include? "AU$500.00"

@wait.until {@driver.find_element(:xpath, "html/body/div[1]/div/div/div[2]/div/div/div/div[2]/div/div[2]/div[2]/ul/button").click}
end

Then /^I checkout as guest$/ do
#system("ruby", ".\\features\\steps_definition\\mysql")


@driver.find_element(:id, "login:guest").click #or driver.find_element(:css, "#login:guest").click
@driver.find_element(:id, "onepage-guest-register-button").click

@driver.quit

  end
