class Edit_Status
  include Capybara::DSL

  def withdraw_property
    within '#propertyStatus' do
      find("option[value='Withdrawn']").click
    end
    find("#st_withdrawn_date").click
    find("td.datepicker_daysCell.datepicker_currentDay").click
    sleep 1
  end

  def click_save
    click_button("saveButton")
    if $brw == 'ff'
    has_no_css?("#saveButton") #bug in firefox
      end
  end

end