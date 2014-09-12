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

  def sell_property
    within '#propertyStatus' do
      find("option[value='Sold']").click
    end
    find("#dateSold").click
    find("td.datepicker_daysCell.datepicker_currentDay").click
    sleep 1
  end

  def sold_price soldPrice
    fill_in 'soldPrice', :with => soldPrice
  end

  def click_save
    find("#saveButton").click
    # if $brw == 'ff'
    # has_no_css?("#saveButton") #bug in firefox
    #   end
  end

end