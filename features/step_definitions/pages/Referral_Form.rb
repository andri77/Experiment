class Referral_Form
  include Capybara::DSL

  def input_street_number number
    fill_in 'propStreetNo', :with => number
  end

  def input_street street
    fill_in 'propStreetName', :with => street
  end

  def input_suburb suburb
    fill_in 'propSuburb', :with => suburb
  end

  def select_state state
    select state, :from => "propState"
  end

  def input_postcode postcode
    fill_in 'propPostcode', :with => postcode
  end

  def input_owner fName
    fill_in 'ownerName', :with => fName
  end

  def input_owner_surname lName
    fill_in 'ownerLastName', :with => lName
  end

  def input_email email
    fill_in 'ownerEmail', :with => email
  end

  def input_mobile mobile
    fill_in 'ownerPhone1', :with => mobile
  end

  def check_sms
    find("#smsContact").click
  end

  def next
    all("[value='Next >']").first.click
  end

end
