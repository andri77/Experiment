

Then(/^as a staff member, I am able to create an appraisal/) do
  within_window(last_window) do
    $control_panel.page_loaded
    $control_panel.add_property
    end

  within_window(last_window) do
    $create_property_page.select_new_appraisal
    end
end
