timeStamp = Time.now.nsec.to_s

Then(/^as a staff member, I select to add a property$/) do
  within_window(last_window) do
    $control_panel.page_loaded
    $control_panel.add_property
    end
end

Then(/^as a staff member, I apply business rules to the property$/) do
  within_window(last_window) do
  $listing_rules.check_letter
  $listing_rules.approve_selected
  $listing_rules.close_window
    sleep 1
    end
  end

Then /^as a staff member, I am able to create a residential property with the following:$/ do |table|
  within_window(last_window) do
    $create_property.click_next
  end

  within_window(last_window) do

    transposed = table.raw.transpose
    mapped = {}
    transposed[0].each_with_index {|k,i|mapped[k] = transposed[1][i]}
    p mapped
    $residential_form.select_agent mapped['agent']
    $residential_form.input_street (rand(9999).to_s + timeStamp + " " + mapped['street'])
    $residential_form.select_suburb
    $residential_form.select_state mapped['state']
    $residential_form.confirm_postcode.should == mapped['postcode']
    $residential_form.low_price mapped['lowPrice']
    $residential_form.high_price mapped['highPrice']
    $residential_form.rea_price mapped['reaPrice']
    $residential_form.click_save
  end
  within_window(last_window) do
  $image_uploader.click_next
    end
end

Then(/^I attach my property image$/) do
  within_window(last_window) do
  find("#addButton").click
  end
  within_window(last_window) do
    within("#masterT") do

    page.attach_file("#input_p18q6on2o5199m1l4olnr17rgpr51", '.\features\screenshots\login.JPG')
    end
    end
  end

Then(/^as a staff member, I can "(.*?)" the property details with the following:$/) do |action, table|

  table.hashes.each do |mapped|

    if action == "edit"
      steps %{ And as a staff member, I select to edit a property
  }

      within_window(last_window) do
        $residential_form.input_street (rand(9999).to_s + timeStamp + " " + mapped['street'])
        $residential_form.select_suburb
        $residential_form.select_state mapped['state']
        $residential_form.input_bedrooms mapped['bedrooms']
        $residential_form.input_bathrooms mapped['bathrooms']
        $residential_form.click_save
        sleep 3
      end

    else

      within_window(last_window) do

        if has_css?("span.ui-icon.ui-icon-closethick") == true
        $listing_rules.close_window
        confirm_changes(timeStamp, mapped)

        else if has_no_css?("span.ui-icon.ui-icon-closethick") == true
        confirm_changes(timeStamp, mapped)
        end
      end
  end
  end
  end
  end

Then(/^as a staff member, I am able to withdraw my property$/) do
  within_window(last_window) do
    $residential_page.edit_status
    sleep 1
  end
  within_window(last_window) do
    $edit_status.withdraw_property
    sleep 1
    $edit_status.click_save
    sleep 1
  end
end

Then(/^as a staff member, I confirm my property is "(.*?)"$/) do |status|
  if status == "withdrawn"
  within_window(last_window) do
    $residential_page.confirm_withdrawn
    $residential_page.check_display.should == "list-no"
  end
  else
    within_window(last_window) do
     $residential_page.check_display.should == "list-yes"
   end
  end

  end

Then(/^I select the first property on white board$/) do
  $control_panel.whiteboard_1stproperty
end

And(/^as a staff member, I select to edit a property$/) do
  within_window(last_window) do
    $residential_page.edit_all
  end
end

Then /^as a staff member, I am able to create a "(.*?)" property for "(.*?)" with the following:$/ do |type, action, table|

  within_window(last_window) do
    $create_property.select_property_type type
    $create_property.select_property_action action
    $create_property.click_next
  end
  sleep 1
  within_window(last_window) do

    transposed = table.raw.transpose
    mapped = {}
    transposed[0].each_with_index {|k,i|mapped[k] = transposed[1][i]}
    p mapped
    $residential_form.select_agent mapped['agent']
    $residential_form.input_street (rand(9999).to_s + timeStamp + " " + mapped['street'])
    $residential_form.select_suburb
    $residential_form.select_state mapped['state']
    $residential_form.confirm_postcode.should == mapped['postcode']
    $residential_form.low_price mapped['lowPrice']
    $residential_form.high_price mapped['highPrice']
    $residential_form.rea_price mapped['reaPrice']
    $residential_form.click_save
  end
  within_window(last_window) do
    $image_uploader.click_next
  end
end

Then /^as a staff member, I am able to create a "(.*?)" rental for "(.*?)" with the following:$/ do |type, action, table|

  within_window(last_window) do
    $create_property.select_property_type type
    $create_property.select_property_action action
    $create_property.click_next
  end
  sleep 1
  within_window(last_window) do

    transposed = table.raw.transpose
    mapped = {}
    transposed[0].each_with_index {|k,i|mapped[k] = transposed[1][i]}
    p mapped
    $residential_form.select_rental_agent mapped['agent']
    $residential_form.input_street (rand(9999).to_s + timeStamp + " " + mapped['street'])
    $residential_form.select_suburb
    $residential_form.select_state mapped['state']
    $residential_form.confirm_postcode.should == mapped['postcode']
    $residential_form.weekly_rental mapped['weekly']
    $residential_form.monthly_rental.should == mapped['monthly']
    $residential_form.rental_bond mapped['bond']
    $residential_form.display_price.should == mapped['display']
    $residential_form.click_save
  end
  within_window(last_window) do
    $image_uploader.click_next
  end
end

Then /^as a staff member, I am able to create a "(.*?)" lease for "(.*?)" with the following:$/ do |type, action, table|

  within_window(last_window) do
    $create_property.select_property_type type
    $create_property.select_property_action action
    $create_property.click_next
  end
  sleep 1
  within_window(last_window) do

    transposed = table.raw.transpose
    mapped = {}
    transposed[0].each_with_index {|k,i|mapped[k] = transposed[1][i]}
    p mapped
    $residential_form.select_rental_agent mapped['agent']
    $residential_form.input_street (rand(9999).to_s + timeStamp + " " + mapped['street'])
    $residential_form.select_suburb
    $residential_form.select_state mapped['state']
    $residential_form.confirm_postcode.should == mapped['postcode']
    $residential_form.lease_price mapped['lease']
    $residential_form.click_save
  end
  within_window(last_window) do
    $image_uploader.click_next
  end
end

#Helpers method
def confirm_changes(timeStamp, mapped)
  within_window(last_window) do
  $residential_page.get_address.downcase.should include (timeStamp + " " + mapped['street'].downcase)
    end
end
