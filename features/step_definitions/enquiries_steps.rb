When /^as a staff member, I select to add a "(.*)" enquiry$/ do |enquiry|
  wait_for_window(".piece_base piece_bar.piece_text_property.piece_border_property.piece_bg_property")
  if enquiry == "buying"
    within_window(last_window) do
      @control_panel.add_quickBuy
    end
  else
    within_window(last_window) do
      @control_panel.add_quickSell
    end
  end
end

Then /^as a staff member, I select to add an inspections feedback$/ do
  within_window(last_window) do
    @control_panel.page_loaded
    @control_panel.add_inspectionFeedback
  end
end

Then /^as a staff memeber, I add a new private inspection$/ do
  within_window(last_window) do
    click_button("addButton")
  end
end

When /^I select agent "(.*)" in the inspection form$/ do |agent|
  within_window(last_window) do
    @inspection_form.input_agent agent
    @inspection_form.select_agent
  end

end

Then /^as a staff member, I am able to fill in the enquiry form with the following:$/ do |table|
  within_window(last_window) do

    mapped = Hash.new
    mapped = table_transpose(table)

    @enquiries_form.input_first_name mapped['fName']
    @enquiries_form.input_surname mapped['lName']
    if $brw == "chrome" #bug in chrome that the agent has to be clicked twice
      @enquiries_form.select_agent
      # @enquiries_form.select_agent Fixed?
    else
      @enquiries_form.select_agent
    end
  end
end

Then /^as a staff member, I am able to fill in the extended enquiry form with the following:$/ do |table|
  within_window(last_window) do
    if @enquiries_form.check_page ==("SELLING ENQUIRIES")
      mapped = Hash.new
      mapped = table_transpose(table)

      @enquiries_form.input_street_number 1
      @enquiries_form.input_street mapped['street']
      @enquiries_form.input_suburb mapped['suburb']
      @enquiries_form.input_state mapped['state']
      @enquiries_form.input_postcode mapped['postcode']
      @enquiries_form.select_type
      @enquiries_form.click_save

    else
      @enquiries_form.select_min_price
      @enquiries_form.select_max_price
      @enquiries_form.click_save
    end
  end
end