class Create_Property_Page
  include Capybara::DSL

  def check_title
    has_title? 'Portplus'
  end

  def click_next
    click_button("Next >")
  end

  def select_new_property
    find(:field, 'existingProperty', with: '2').click
  end

  def select_new_appraisal
    find(:field, 'existingProperty', with: '3').click
  end

  def select_not_on_market
    find(:field, 'existingProperty', with: '4').click
  end

  def select_not_called
    find(:field, 'existingProperty', with: '5').click
  end

  def select_property_type type
    select type, :from => "propertyType"
  end

  def select_property_action action
    select action, :from => "propertyAction"
  end

end