require '.\features\step_definitions\pages\Control_Panel.rb'
require '.\features\step_definitions\pages\Client_Manager.rb'
require '.\features\step_definitions\pages\Client_Type.rb'
require '.\features\step_definitions\pages\Client_Form.rb'
require 'D:\projects\RubySpike\vendor\ruby\1.9.1\gems\capybara-1.1.2\lib\capybara\driver\base.rb'

cForm = Client_Form.new

Given /^I am at login page$/ do
  steps %{
    Given I am on Portplus homepage
    And I fill in my user name as "dcropper"
    And I fill in my password as "Pa$$w0rd"
    When I click login button
    Then I should be directed to the login page
}
   Control_Panel.check_heading
end

When /I search for "(.*)"/ do |keyword|
  Control_Panel.quick_search keyword

  results = find(".ui-autocomplete .ui-corner-all", :match => :first).text
  puts "my first result " + results
  results.downcase == '[Agent 3406] : Real Estate Group [MELBOURNE]'.downcase
  #assigning to array doesn't work atm, use the below method if you need to traverse to multiple elements
  puts "my second result " +  all(".ui-autocomplete .ui-corner-all")[1].text

end


Given /^I click on the first agent$/ do
  find(".ui-autocomplete .ui-corner-all", :match => :first).click
end

When /^I login as a staff member$/ do
find("#loginTool").click
end

Then(/^I should be directed to client manager page$/) do
  page.driver.wait_until { page.has_title? 'Portplus' }
  Client_Manager.check_title
  Client_Manager.check_login == 'Login as Tony Horn'
end

Then(/^as a staff member, I select to add a client$/) do
  within_window(page.driver.browser.window_handles.last) do
    find("td #td_add").click
    # require 'debugger'
    # debugger
    # 1
    sleep 1
    find("td #td_add").click
    find("#clientButton").click
  end
end


Then(/^as a staff member, I am able to select my options for the new client$/) do
  within_window(page.driver.browser.window_handles.last) do

    Client_Type.select_vendor

    Client_Type.select_vendor_rating

    Client_Type.select_vendor_source

    Client_Type.select_vendor_staff

    Client_Type.select_category

    Client_Type.click_next

  end
end

Then /^as a staff member, I am able to fill in the form with the following:$/ do |table|
  within_window(page.driver.browser.window_handles.last) do

  transposed = table.raw.transpose
  mapped = {}
  transposed[0].each_with_index {|k,i|mapped[k] = transposed[1][i]}
  p mapped
  p mapped['fName']
  cForm.input_first_name mapped['fName']
  cForm.input_last_name mapped['lName']
  cForm.input_address mapped['address']
  cForm.input_suburb mapped['suburb']
  cForm.input_postcode mapped['postcode']
  cForm.input_email mapped['email']
  cForm.email_checked
  cForm.click_client_name

end

end


# Given /^I am on Portplus homepage$/ do
#   page.driver.browser.manage.window.maximize
#   HOME.visit_page $base_url
#   HOME.check_title
# end
#
# When /^I fill in my user name as "(.*?)"$/ do |userName|
#     HOME.fill_in_username userName
# end
#
# When /^I fill in my password as "(.*?)"$/ do |password|
#   HOME.fill_in_password password
# end
#
#   When /^I click login button$/ do
#   HOME.click_login
#     end
#
# When /^I should be directed to the login page$/ do
#   page.current_url.should include 'cHelpdesk.controlpanel'
# end


#require 'debugger'
#  debugger
#  1


