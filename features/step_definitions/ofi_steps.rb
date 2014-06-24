Then(/^as a staff member, I select to add an OFI$/) do
  within_window(last_window) do
    $control_panel.page_loaded
    $control_panel.add_ofi

  end
end

Then(/^as a staff member, I select the first listed property$/) do
  within_window(last_window) do
    $ofi_form.search_property "testing"
    $ofi_form.click_search

    $ofi_form.select_property
    $ofi_form.add_list
    $ofi_form.click_next

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
    all("#chk_selectAllForthGroup")[0].click
    find("#deleteButton").click
    accept_alert
  end

end

