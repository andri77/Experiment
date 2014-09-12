Then(/^as a staff member, I select to add a property$/) do
  within_window(last_window) do
    @control_panel.page_loaded
    @control_panel.add_property
  end
end

Then(/^as a staff member, I apply business rules to the property$/) do
  rescue_window("#jobID_check_8")
  within_window(last_window) do
    @listing_rules.check_letter
    @listing_rules.approve_selected
    @listing_rules.close_window
    sleep 1
  end
end

Then /^as a staff member, I am able to create a residential property with the following:$/ do |table|
  within_window(last_window) do
    @create_property.click_next
  end

  within_window(last_window) do

    mapped = Hash.new
    mapped = table_transpose(table)

    @property_form.select_agent mapped['agent']
    @property_form.input_street_number @timeStamp
    @property_form.input_street mapped['street']
    @property_form.select_suburb
    @property_form.select_state mapped['state']
    @property_form.confirm_postcode.should == mapped['postcode']
    @property_form.low_price mapped['lowPrice']
    @property_form.high_price mapped['highPrice']
    @property_form.rea_price mapped['reaPrice']
    @property_form.input_bedrooms mapped['bedrooms']
    @property_form.input_bathrooms mapped['bathrooms']
    @property_form.input_garages mapped['garages']
    @property_form.input_toilets mapped['toilets']
    @property_form.input_carports mapped['carports']
    @property_form.headline mapped['headline']
    @property_form.description mapped['description']
    @property_form.set_study
    @property_form.click_save
  end
  within_window(last_window) do
    @image_uploader.click_next

  end
end

Then(/^I attach my property image$/) do
  within_window(last_window) do
    find("#addButton").click
    sleep 3
  end



  within_window(last_window) do

    # @image_upload_url = current_url.to_s
    # puts @image_upload_url
    # require 'selenium-webdriver'
    #
    # @driver = Selenium::WebDriver.for :chrome
    # @driver.manage.window.resize_to(1200, 800)
    # @driver.get @image_upload_url
    # @driver.find_element(:id, "member_username").send_keys "dcropper"
    # @driver.find_element(:id, "member_password").send_keys "Pa$$w0rd"
    # @driver.find_element(:id, "loginButton").click
    #
    # @driver.get @image_upload_url


      within("#masterT") do
      within("#html4_uploader form") do
        analyze
        # find("input")
        # page.attach_file("input", '.\features\screenshots\login.jpeg')
        # element = within_window(last_window) do find("input[type='file']") end
        # element.native.send_keys("D:/projects/portplus-automation/features/screenshots/login.jpeg")
        # element.native.find_element(:id, "input_p1907q6dsu4lu1ev0cfc57d35h1").send_key "D:/projects/portplus-automation/House 2.jpg"

        # (rdb:1) element = find("#andri")
        # #<Capybara::Element tag="input">
        # (rdb:1) element.native.send_keys("D:/projects/portplus-automation/features/screenshots/login.jpeg")
        # nil
        # (rdb:1) find("#andri")
        # #<Capybara::Element tag="input">
        # (rdb:1) element.native.send_keys("D:/projects/portplus-automation/features/screenshots/login.jpeg")

      end
    end
  end
end

Then(/^as a staff member, I can add vendor to property$/) do
  #search for vendor "John"
  within_window(last_window) do
    @residential_page.add_vendor "John"
    @residential_page.search

  end
#select first vendor
# within_window(find_window_handle("#quickSearch_div")) do
  rescue_window("iframe#clientListIframe")
  within_window(last_window) do
    begin
      within_frame(find("iframe#clientListIframe")) do
        find("#td_clt_1 a").click
      end
    rescue Exception => e
      puts e.to_s.red
    end
  end
#Attach vendor
  rescue_window("#clientNameAdd")
  within_window(last_window) do
    click_button("Go")
  end
end

Then(/^as a staff member, I can sell the property for \$"(.*?)" with vendor$/) do |soldPrice|

  rescue_window(".status-img > a:nth-child(1) > div:nth-child(1)")

  within_window(last_window) do
    find(".status-img > a:nth-child(1) > div:nth-child(1)").click
  end
  within_window(last_window) do

    select "SOLD", :from => "clientPropertyStatus_id"
    fill_in 'buyer_name', :with => "John"
    click_button("Search")
    within_frame("clientSearch_iframe") do
      find(:field, 'client_id', with: "1153126").click
    end

    click_button("Attach Buyer")
    click_button("Next >")
  end

  within_window(last_window) do
    fill_in 'salePrice', :with => soldPrice
    select "Owner Occupier", :from => "buyingReason_id"

    # find("#signed_date").set "date"
    all(".datepicker_trigger")[1].click
    sleep 2
    find("td.datepicker_daysCell.datepicker_currentDay").click

    # find("#dateSold").set "date"
    all(".datepicker_trigger")[2].click
    sleep 2
    find("td.datepicker_daysCell.datepicker_currentDay").click


    click_button("Save & Next")
  end

  rescue_window(".formField.jqReadonly")
  within_window(last_window) do
#Need to be refactored and parameterized
    within_frame("commissionAwardsIframe") do
      find("#sellingFee_fixedPercent").set 5
      click_button("Re-calculate")
      select "Jayne Robinson", :from => "manager_staffPerson_1"
      select "Jane Fort", :from => "seller_staffPerson_1"
      click_button("Save & Close")
    end
  end

end

Then(/^as a staff member, I can sell the property for \$"(.*?)"$/) do |soldPrice|
  within_window(last_window) do
    @residential_page.edit_status
    sleep 1
  end
  within_window(last_window) do
    @edit_status.sell_property
    sleep 1
    @edit_status.sold_price soldPrice
    @edit_status.click_save
    sleep 1
  end

end

Then(/^as a staff member, I can "(.*?)" the property details with the following:$/) do |action, table|

  table.hashes.each do |mapped|

    if action == "edit"
      steps %{ And as a staff member, I select to edit a property
  }
      sleep 2
      within_window(last_window) do
        @property_form.input_street_number @timeStamp
        @property_form.input_street mapped['street']
        @property_form.select_suburb
        @property_form.select_state mapped['state']
        @property_form.input_bedrooms mapped['bedrooms']
        @property_form.input_bathrooms mapped['bathrooms']
        @property_form.click_save
        sleep 3
      end

    else
      sleep 3
      within_window(last_window) do
        if has_css?("span.ui-icon.ui-icon-closethick") == true
          @listing_rules.close_window
          confirm_changes(@timeStamp, mapped)

        else
          if has_no_css?("span.ui-icon.ui-icon-closethick") == true
            confirm_changes(@timeStamp, mapped)
          end
        end
      end
    end
  end
end

Then(/^as a staff member, I am able to withdraw my property$/) do
  within_window(last_window) do
    @residential_page.edit_status
    sleep 1
  end
  within_window(last_window) do
    @edit_status.withdraw_property
    @edit_status.click_save
    sleep 1
  end
end

Then(/^as a staff member, I confirm my property is "(.*?)"$/) do |status|
  sleep 3
  if status == "withdrawn"
    within_window(last_window) do
      @residential_page.confirm_status status
      @residential_page.check_display.should == "list-no"
    end
  else
    if status == "sold"
      within_window(last_window) do
        @residential_page.confirm_status status
      end
    else
      within_window(last_window) do
        @residential_page.confirm_status status
        @residential_page.check_display.should == "list-yes"
      end
    end
  end
end

Then(/^I select the first property on white board$/) do
  @control_panel.whiteboard_1stproperty
end

And(/^as a staff member, I select to edit a property$/) do
  within_window(last_window) do
    @residential_page.edit_all
  end
end

Then /^as a staff member, I am able to create a "(.*?)" property for "(.*?)" with the following:$/ do |type, action, table|

  within_window(last_window) do
    @create_property.select_property_type type
    @create_property.select_property_action action
    @create_property.click_next
  end
  sleep 1
  within_window(last_window) do

    mapped = Hash.new
    mapped = table_transpose(table)
    @property_form.select_agent mapped['agent']
    @property_form.input_street_number @timeStamp
    @property_form.input_street mapped['street']
    @property_form.select_suburb
    @property_form.select_state mapped['state']
    @property_form.confirm_postcode.should == mapped['postcode']
    @property_form.low_price mapped['lowPrice']
    @property_form.high_price mapped['highPrice']
    @property_form.rea_price mapped['reaPrice']
    @property_form.headline mapped['headline']
    @property_form.description mapped['description']
    @property_form.click_save

  end
  within_window(last_window) do
    @image_uploader.click_next
  end
end

Then /^as a staff member, I am able to create a "(.*?)" rental "(.*?)" with the following:$/ do |type, action, table|

  within_window(last_window) do
    @create_property.select_property_type type
    @create_property.select_property_action action
    @create_property.click_next
  end
  sleep 1
  within_window(last_window) do

    mapped = Hash.new
    mapped = table_transpose(table)
    @property_form.select_rental_agent mapped['agent']
    @property_form.input_street_number @timeStamp
    @property_form.input_street mapped['street']
    @property_form.select_suburb
    @property_form.select_state mapped['state']
    @property_form.confirm_postcode.should == mapped['postcode']
    @property_form.weekly_rental mapped['weekly']
    @property_form.monthly_rental.should == mapped['monthly']
    @property_form.rental_bond mapped['bond']
    @property_form.display_price.should == mapped['display']

    if type == "Residential"
      @property_form.input_bedrooms mapped['bedrooms']
      @property_form.input_bathrooms mapped['bathrooms']
      @property_form.input_garages mapped['garages']
      @property_form.input_carports mapped['carports']
    end

    @property_form.click_save
  end
  within_window(last_window) do
    @image_uploader.click_next
  end
end

Then /^as a staff member, I am able to create a "(.*?)" lease "(.*?)" with the following:$/ do |type, action, table|

  within_window(last_window) do
    @create_property.select_property_type type
    @create_property.select_property_action action
    @create_property.click_next
  end
  sleep 1
  within_window(last_window) do

    mapped = Hash.new
    mapped = table_transpose(table)
    @property_form.select_rental_agent mapped['agent']
    @property_form.input_street_number @timeStamp
    @property_form.input_street mapped['street']
    @property_form.select_suburb
    @property_form.select_state mapped['state']
    @property_form.confirm_postcode.should == mapped['postcode']
    @property_form.lease_price mapped['lease']
    @property_form.click_save
  end
  within_window(last_window) do
    @image_uploader.click_next
  end
end

Then /^as a staff member, I am able to create a "(.*?)" auction property for "(.*?)" with the following:$/ do |type, action, table|

  within_window(last_window) do
    @create_property.select_property_type type
    @create_property.select_property_action action
    @create_property.click_next
  end
  sleep 1
  within_window(last_window) do

    mapped = Hash.new
    mapped = table_transpose(table)

    @property_form.select_agent mapped['agent']
    @property_form.auction_date
    @property_form.auction_time "01:00 PM"
    @property_form.input_street_number @timeStamp
    @property_form.input_street mapped['street']
    @property_form.select_suburb
    @property_form.select_state mapped['state']
    @property_form.confirm_postcode.should == mapped['postcode']
    @property_form.low_price mapped['lowPrice']
    @property_form.high_price mapped['highPrice']
    @property_form.rea_price mapped['reaPrice']
    @property_form.headline mapped['headline']
    @property_form.description mapped['description']
    @property_form.click_save


  end
  within_window(last_window) do
    @image_uploader.click_next
  end
end

#Helpers method
def confirm_changes(timeStamp, mapped)
  within_window(last_window) do
    puts timeStamp
    @residential_page.get_address.downcase.should include (timeStamp + " " + mapped['street'].downcase)
  end
end

