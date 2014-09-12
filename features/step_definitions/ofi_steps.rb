Then(/^as a staff member, I select to add an OFI$/) do
  within_window(last_window) do
    @control_panel.page_loaded
    @control_panel.add_ofi

  end
end

Then(/^as a staff member, I select the first listed property$/) do
  within_window(last_window) do
    @ofi_form.search_property "testing"
    @ofi_form.click_search

    @ofi_form.select_property
    @ofi_form.add_list
    @ofi_form.click_next

  end
end

Then(/^as a staff member, I assign an OFI to the property$/) do
  within_window(last_window) do
    find("#table_0 > tbody:nth-child(1) > tr:nth-child(1) > td:nth-child(1) > table:nth-child(1) > tbody:nth-child(1) > tr:nth-child(2) > td:nth-child(1) input").click
    click_button("Save")
  end
end

Then(/^as a staff member, I delete the OFI$/) do
  within_window(last_window) do
    click_button("Search")
    # all("#pastTab > div:nth-child(1)")[0].click
    all("#chk_selectAllForthGroup")[0].click
    find("#deleteButton").click
    accept_alert
  end

end

Then(/^as a staff member, I select to add an OFI Feedback$/) do
  within_window(last_window) do
    @control_panel.page_loaded
    @control_panel.add_ofiFeedback

  end
end

Then(/^as a staff member, I select to add an OFI from feedback page$/) do
  within_window(last_window) do
    click_button("addButton")
  end
end

Then(/^as a staff member, I select the "(.*?)" tab$/) do |tab|
  within_window(last_window) do
    find("#pastTab > div").click
  end
end

Then(/^as a staff member, I select to add a buyer feedback$/) do
  wait_for_window(".jqOfiCheck.jqy_chk_all")
  within_window(last_window) do
    all(".jqOfiCheck.jqy_chk_all")[0].click
    click_button("commentButton")
  end
end

Then(/^as a staff member, I can confirm that feedback is entered correctly with the following:$/) do |table|
  within_window(last_window) do
    find("#row_1 > td:nth-child(7) > a").text.should_not == "--"
    find("#row_1 > td:nth-child(7) > a").click
  end
  sleep 1
  within_window(last_window) do

    mapped = Hash.new
    mapped = table_transpose(table)
    find("table > tbody > tr > td > table:nth-child(6) > tbody > tr:nth-child(1) > td:nth-child(4)").text.should include("OFI / Open Home")
    find("table > tbody > tr > td > table:nth-child(5) > tbody > tr > td:nth-child(2)").text.should include(mapped['email'])
    find("table > tbody > tr > td > table:nth-child(5) > tbody > tr > td:nth-child(1)").text.downcase.should include(mapped['lName'].downcase + ", " + mapped['fName'].downcase)
    find("table > tbody > tr > td > table:nth-child(6) > tbody > tr:nth-child(1) > td:nth-child(1)").text.should(include mapped['mobile'])
    find("table > tbody > tr > td > table:nth-child(1) > tbody > tr > td > table > tbody > tr:nth-child(2) > td").text.should(include mapped['address'])
    find("table > tbody > tr > td > table:nth-child(1) > tbody > tr > td > table > tbody > tr:nth-child(1) > td").text.should(include mapped['agent'])
  end
end

Then /^as a staff member, I fill in the OFI feedback form with the following:$/ do |table|
  within_window(last_window) do

    mapped = Hash.new
    mapped = table_transpose(table)

    @ofi_feedback_form.input_first_name mapped['fName']
    @ofi_feedback_form.input_last_name mapped['lName']
    @ofi_feedback_form.input_email mapped['email']
    @ofi_feedback_form.input_mobile mapped['mobile']
    @ofi_feedback_form.select_source
    @ofi_feedback_form.select_comment_type
    @ofi_feedback_form.select_client_attributes
    @ofi_feedback_form.click_save

  end

end