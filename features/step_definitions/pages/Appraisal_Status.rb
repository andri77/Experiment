class Appraisal_Status
  include Capybara::DSL


  def select_status status
    select status, :from => "appraisal_status"
  end

  def set_display show
    #this is a radio button, select by value
    find(:field, 'active', with: show).click
  end

  def click_save
    click_button("saveButton")
  end

end