class Client_Form
  include Capybara::DSL

  def input_first_name fName
    fill_in 'firstName', :with => fName
  end

  def input_last_name lName
    fill_in 'surname', :with => lName
  end

  def fill_client_name fName
    fill_in 'client_name', :with => fName
  end

  def fill_email email
    fill_in 'email', :with => email
  end

  def input_street street
    fill_in 'client_streetName_phys', :with => street
  end

  def input_suburb suburb
    fill_in 'client_suburb_phys', :with => suburb
  end

  def input_postcode postcode
    fill_in 'client_postcode_phys', :with => postcode
  end

  def input_email mobile
    fill_in 'phoneMobile', :with => mobile
  end

  def phone_checked
    find("#phoneContact").checked?
  end

  def sms_checked
    find("#smsContact").checked?
  end

  def click_save
    click_button("Save")
  end

  def fill_min_price price_min
    fill_in 'price_min', :with => price_min
  end

  def fill_max_price price_max
    fill_in 'price_max', :with => price_max
  end

  #this is a drop box, select by value
  def select_state state
    select state, :from => "client_state_phys"
  end

  def set_state state
    select state, :from => "client_state_post"
  end

  def check_street street
    find_field('client_streetName_phys').value.downcase.should == street
  end

  def check_suburb suburb
    find_field('client_suburb_phys').value.downcase.should == suburb
  end

  def check_state state
    find_field('client_state_phys').value.should == state
  end

  def check_postcode postcode
    find_field('client_postcode_phys').value.downcase.should == postcode
  end

end