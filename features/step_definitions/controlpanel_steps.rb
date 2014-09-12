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
  @control_panel.quick_search keyword

  results = find(".ui-autocomplete .ui-corner-all", :match => :first).text
  puts "my first result " + results
  results.downcase == '[Agent 3406] : Real Estate Group [MELBOURNE]'.downcase
  puts "my second result " + all(".ui-autocomplete .ui-corner-all")[1].text

end


Given /^I click on the first agent$/ do
  find(".ui-autocomplete .ui-corner-all", :match => :first).click
end

When /^I login as a staff member$/ do
  @client_manager.staff_login
end

When /^I obtain master password$/ do
  @master_password = @client_manager.get_password
  puts @master_password
end

When /^as a staff member, I select to add a staff$/ do
  within_window(last_window) do
    @control_panel.page_loaded
    wait_for_css("#offcP", '@control_panel.show_menu')
    @control_panel.click_admin
    msg = @control_panel.add_staff
    puts msg
    # msg.should include("Please enter your master password in the 'Tools' section to access this feature")
    accept_alert
    @control_panel.click_tool
    @control_panel.submit_password @master_password
    @control_panel.add_staff
  end
end



When /^I login as a web-choice agent$/ do
  if $brw == 'chrome'
  find("div.ui-accordion-header:nth-child(11) > a:nth-child(2)").click
  find("div.accordianContent:nth-child(12) > table:nth-child(1) > tbody:nth-child(1) > tr:nth-child(7) > td:nth-child(7) > a:nth-child(1)").click
    end
end

When /^I select property in "(.*)" in web-choice$/ do |plat| #'2689804'
  if $brw == 'chrome'
  prop_no = String.new
  if plat == "stage"
    prop_no = '2677729'
  elsif plat == "qa"
    prop_no = '2689804'
  else
    prop_no = '2719552'
  end
  puts prop_no
  within_window(last_window) do
    sleep 3
    page.execute_script("$(window.v2SearchResultsIframe.do_showPropertySummary(#{prop_no}))")
  end
  end
end

And /^I upload an image via web-choice$/ do
  if $brw == 'chrome'
  within_window(last_window) do
    find(".propertyCollapsedBorder > tbody:nth-child(1) > tr:nth-child(10) > td:nth-child(1) > a:nth-child(1)").click
  end

  within_window(last_window) do
    click_button("Upload Images")
  end

  within_window(last_window) do
    page.driver.browser.find_elements(:class, "formfield")[1].send_keys File.expand_path("./features/House 2.jpg")
    click_button("Upload")
  end
    end
end

And /^I confirm and delete the image in web-choice$/ do
  if $brw == 'chrome'

  within_window(last_window) do
    puts "Image URL " + find("body > table > tbody > tr:nth-child(1) > td > div:nth-child(4) > form > table > tbody > tr > td:nth-child(1) > a > img").native.attribute("src")
    find("body > table > tbody > tr:nth-child(1) > td > div:nth-child(4) > form > table > tbody > tr > td:nth-child(1) > a > img").native.attribute("src").should =~ /http:\/\/\S+\/resize\/portplus\/storage\/\d+\/\w+\S+300/
    find("body > table > tbody > tr:nth-child(1) > td > div:nth-child(4) > form > table > tbody > tr > td:nth-child(1) > a > img").native.attribute("width").should == "300"
    find("body > table > tbody > tr:nth-child(1) > td > div:nth-child(4) > form > table > tbody > tr > td:nth-child(1) > a > img").native.attribute("height").should == "200"
    select "Delete", :from => "opts_1"
    accept_alert
  end
  within_window(last_window) do
    page.driver.browser.close
  end

  within_window(last_window) do
    page.driver.browser.close
  end

  within_window(last_window) do
    page.driver.browser.navigate.refresh
    image_thumb = "#masterT > tbody > tr > td > div:nth-child(7) > table:nth-child(7) > tbody > tr > td > table > tbody > tr > td:nth-child(1) > table > tbody > tr:nth-child(10) > td:nth-child(2) > table > tbody > tr > td:nth-child(1) > div > img"
    puts "Image URL " + find(image_thumb).native.attribute("src")
    find(image_thumb).native.attribute("src").should =~ /http:\/\/\S+\/resize\/portplus\/storage\/\d+\/\w+\S+53/
    find(image_thumb).native.attribute("width").should == "53"
    find(image_thumb).native.attribute("height").should == "35"
  end
    end
end


Then(/^I should be directed to client manager page$/) do
  @client_manager.check_title
  @client_manager.check_login == 'Login as Tony Horn'
end

Given(/^I should wait for "(\d+)" seconds$/) do |seconds|
  sleep (seconds.to_i)
end

Then(/^as a staff member, I select to add a client$/) do
  within_window(last_window) do
    @control_panel.page_loaded
    @control_panel.add_client
  end
end

Then(/^as a staff member, I am able to select my options for the new vendor$/) do
  wait_for_window(".ppBtn")
  within_window(last_window) do

    @client_type.select_vendor

    @client_type.select_vendor_rating

    @client_type.select_vendor_source

    @client_type.select_vendor_staff

    @client_type.select_category

    @client_type.click_next

  end
end

Then(/^as a staff member, I am able to select my options for the new buyer$/) do
  within_window(last_window) do

    @client_type.select_buyer

    @client_type.select_buyer_rating

    @client_type.select_buyer_source

    @client_type.select_buyer_staff

    @client_type.select_category

    @client_type.click_next

  end
end

Then(/^as a staff member, I am able to select my options for the new tenant$/) do
  within_window(last_window) do

    @client_type.select_tenant

    @client_type.select_tenant_rating

    @client_type.select_tenant_source

    @client_type.select_tenant_staff

    @client_type.select_category

    @client_type.click_next

  end
end

Then(/^as a staff member, I am able to select my options for the new landlord$/) do
  within_window(last_window) do

    @client_type.select_landlord

    @client_type.select_landlord_rating

    @client_type.select_landlord_source

    @client_type.select_landlord_staff

    @client_type.select_category

    @client_type.click_next

  end
end

Then(/^as a staff member, I am able to select my options for the new general$/) do
  within_window(last_window) do

    @client_type.select_general

    @client_type.select_general_rating

    @client_type.select_general_source

    @client_type.select_general_staff

    @client_type.select_category

    @client_type.click_next

  end
end


Then(/^I will be directed to Calendar Page$/) do
  find_window_handle("td.title.bold")
  within_window(last_window) do
    within("#masterT") do
      find("#masterT > tbody:nth-child(1) > tr:nth-child(1) > td:nth-child(1)")
    end
    puts "I'm at Calendar Page"
  end

end

Then /^as a staff member, I am able to fill in the form with the following:$/ do |table|
  within_window(last_window) do

    mapped = Hash.new
    mapped = table_transpose(table)
    @client_form.input_first_name mapped['fName']
    @client_form.input_last_name mapped['lName']
    @client_form.input_street mapped['street']
    @client_form.input_suburb mapped['suburb']
    @client_form.set_state mapped['state']
    @client_form.input_postcode mapped['postcode']
    @client_form.input_email mapped['mobile']
    @client_form.phone_checked
    @client_form.sms_checked
    @client_form.fill_client_name " "
    @client_form.click_save

  end

end

Then /^as a staff member, I am able to fill in the client form with the following:$/ do |table|
  within_window(last_window) do

    mapped = Hash.new
    mapped = table_transpose(table)
    @client_form.input_first_name mapped['fName']
    @client_form.input_last_name mapped['lName']
    @client_form.input_street mapped['street']
    @client_form.input_suburb mapped['suburb']
    @client_form.set_state mapped['state']
    @client_form.input_postcode mapped['postcode']
    @client_form.input_email mapped['mobile']
    @client_form.phone_checked
    @client_form.sms_checked
    @client_form.fill_client_name mapped['fName']
    @client_form.fill_min_price mapped['min_price']
    @client_form.fill_max_price mapped['max_price']
    @client_form.click_save

  end

end


Then /^as a staff member, I am able to fill in the staff form with the following:$/ do |table|
  within_window(last_window) do

    mapped = Hash.new
    mapped = table_transpose(table)
    # analyze
    @staff_form.input_first_name mapped['fName']
    @staff_form.input_last_name mapped['lName']
    @staff_form.fill_email mapped['email']
    @staff_form.fill_security_email (@timeStamp + mapped['email'])
    @staff_form.select_department
    @staff_form.fill_position mapped['position']
    @staff_form.fill_username (@timeStamp + mapped['username'])
    @staff_form.click_save

  end

end
Then /^I will be directed to Staff Management Page$/ do
  within_window(last_window) do
    staff_number = (all("tr.dataTableRow").size + 1)
    puts staff_number
    find("tr.dataTableRow:nth-child(#{staff_number}) > td:nth-child(1) > a:nth-child(1)").text.should include("Super Staff")
    find("tr.dataTableRow:nth-child(#{staff_number}) > td:nth-child(9) > a:nth-child(1)").click
    accept_alert
  end
  within_window(last_window) do
    select "Super Staff", :from => "destinationStaffId"
    click_button("Save")
  end

  within_window(last_window) do
    page.html.should_not include("Super Staff")
  end
  end

Then(/^as a staff member, I can search for a client "(.*?)"$/) do |name|

  within_window(last_window) do
    @control_panel.page_loaded
    @control_panel.smart_search name
    closure = '' 'find("#results #resultIframeWrapper #resultIframe")' ''
    wait_for_css("#results #resultIframeWrapper #resultIframe", closure)
  end
end

Then(/^as a staff member, I can select the client$/) do

  within_window(last_window) do
    @control_panel.click_agent
  end

end

Then(/^as a staff member, I can click on the edit all button$/) do
  within_window(last_window) do
    @vendor_page.check_title
    @vendor_page.click_editAll
  end
end

Then(/^as a staff member, I can select the client's physical address$/) do
  sleep 3
  within_window(last_window) do
    @vendor_page.check_title

    @vendor_page.click_physAddr
  end
end

Then(/^as a staff member, I can "(.*?)" the client details with the following:$/) do |action, table|

  table.hashes.each do |mapped|

    if action == "edit"
      steps %{ And as a staff member, I can click on the edit all button
  }

      within_window(last_window) do

        @client_form.input_street mapped['street']
        @client_form.input_suburb mapped['suburb']
        @client_form.select_state mapped['state']
        @client_form.input_postcode mapped['postcode']
        @client_form.click_save
      end

    else
      within_window(last_window) do
        @client_form.check_street mapped['street'].downcase
        @client_form.check_suburb mapped['suburb'].downcase
        @client_form.check_state mapped['state']
        @client_form.check_postcode mapped['postcode'].downcase
      end

    end
  end

end

Then(/^as a staff member, I can select the tenant$/) do

  within_window(last_window) do
    @control_panel.click_agent
  end

end



Then(/^as a staff member, I can select the tenant's physical address$/) do
  sleep 3
  within_window(last_window) do
    @vendor_page.check_title

    @vendor_page.click_physAddr
  end
end



Then(/^I take a screenshot off the "(.*?)" page and save it at "(.*?)"$/) do |image, location|
  within_window(last_window) do
    page.driver.save_screenshot("#{location}#{image}.PNG")
  end
end

Then(/^I compare the screenshots for "(.*?)" page$/) do |image|
  pixel_diff(image)
end





