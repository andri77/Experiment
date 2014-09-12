class Staff_Form
  include Capybara::DSL

  def input_first_name fName
    fill_in 'staffChristian', :with => fName
  end

  def input_last_name lName
    fill_in 'staffSurname', :with => lName
  end

  def fill_position position
    fill_in 'staffPosition', :with => position
  end

  def fill_username username
    fill_in 'username', :with => username
  end

  def fill_email email
    fill_in 'staffEmail', :with => email
  end

  def fill_security_email email
    fill_in 'staffEmailPrivate', :with => email
  end

  def select_department
    find("option[value='8707']").click
  end

  def click_save
    click_button("Save")
  end

 end