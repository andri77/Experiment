
Given /^I am at login page$/ do
  steps %{
    Given I am on Portplus homepage
    And as a user, I fill in my user name as "dcropper"
    And as a user, I fill in my password as "Pa$$w0rd"
    When I click login button
    Then I should be directed to the login page
}

end

When /I search for "(.*)"/ do |keyword|
  $control_panel.quick_search keyword

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
  $client_manager.staff_login
end

Then(/^I should be directed to client manager page$/) do
  $client_manager.check_title
  $client_manager.check_login == 'Login as Tony Horn'
end

Given(/^I should wait for "(\d+)" seconds$/) do |seconds|
  sleep (seconds.to_i)
end

Then(/^as a staff member, I select to add a client$/) do
  within_window(last_window) do
    $control_panel.page_loaded
    $control_panel.add_client
  end
end

Then(/^as a staff member, I am able to select my options for the new client$/) do
  within_window(last_window) do

    $client_type.select_vendor

    $client_type.select_vendor_rating

    $client_type.select_vendor_source

    $client_type.select_vendor_staff

    $client_type.select_category

    $client_type.click_next

  end
end

Then /^as a staff member, I am able to fill in the form with the following:$/ do |table|
  within_window(last_window) do

  transposed = table.raw.transpose
  mapped = {}
  transposed[0].each_with_index {|k,i|mapped[k] = transposed[1][i]}
  p mapped
  $client_form.input_first_name mapped['fName']
  $client_form.input_last_name mapped['lName']
  $client_form.input_street mapped['street']
  $client_form.input_suburb mapped['suburb']
  $client_form.set_state mapped['state']
  $client_form.input_postcode mapped['postcode']
  $client_form.input_email mapped['mobile']
  $client_form.phone_checked
  $client_form.sms_checked
  $client_form.fill_client_name mapped['fName']
  $client_form.click_save

  end

end

Then(/^as a staff member, I can search for a client "(.*?)"$/) do | name |

  within_window(last_window) do

    $control_panel.page_loaded
    $control_panel.smart_search name
    closure = '''find("#results #resultIframeWrapper #resultIframe")'''
    wait_for_css("#results #resultIframeWrapper #resultIframe", closure)
    end
end

# last_window

Then(/^as a staff member, I can select the agent$/) do

  within_window(last_window) do
  $control_panel.click_agent
  end

  end

Then(/^as a staff member, I can click on the edit all button$/) do
  within_window(last_window) do
    $vendor_page.check_title
    $vendor_page.click_editAll
end
end

Then(/^as a staff member, I can select the agent's pyhsical address$/) do
  sleep 3
  within_window(last_window) do
    $vendor_page.check_title

    $vendor_page.click_physAddr
  end
end

Then(/^as a staff member, I can "(.*?)" the client details with the following:$/) do |action, table|

  table.hashes.each do |mapped|

  if action == "edit"
  steps %{ And as a staff member, I can click on the edit all button
  }

  within_window(last_window) do

      $client_form.input_street mapped['street']
      $client_form.input_suburb mapped['suburb']
      $client_form.select_state mapped['state']
      $client_form.input_postcode mapped['postcode']
      $client_form.click_save
      end

  else
    within_window(last_window) do
    $client_form.check_street mapped['street'].downcase
    $client_form.check_suburb mapped['suburb'].downcase
    $client_form.check_state mapped['state']
    $client_form.check_postcode mapped['postcode'].downcase
  end

  end
end

end

Then(/^I take a screenshot off the "(.*?)" page and save it at "(.*?)"$/) do | image, location |
  page.driver.save_screenshot("#{location}#{image}.PNG")
end

Then(/^I compare the screenshots for "(.*?)" page$/) do | image |
  pixel_diff(image)
end

#require 'debugger'
#  debugger
#  1


