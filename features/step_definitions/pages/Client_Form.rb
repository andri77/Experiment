class Client_Form
  include Capybara::DSL

  def input_first_name fName
    fill_in 'firstName', :with=> fName
  end

  def input_last_name lName
    fill_in 'surname', :with=> lName
  end

  def click_client_name
    find("#client_name").click
  end

  def input_address address
    fill_in 'client_streetName_phys', :with=> address
  end

  def input_suburb suburb
    fill_in 'client_suburb_phys', :with=> suburb
  end

  def input_postcode postcode
    fill_in 'client_postcode_phys', :with=> postcode
  end

  def input_email email
    fill_in 'email', :with=> email
  end

  def email_checked
    find("#emailContact").checked?
  end

  def click_save
    find(".ppBtn.v1").click
 end

end