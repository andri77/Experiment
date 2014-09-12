class Enquiries_Form
  include Capybara::DSL

  def check_page
    find(".piece_bar").text
  end

  def input_first_name firstName
    fill_in 'firstName', :with => firstName
  end

  def input_surname surname
    fill_in 'surname', :with => surname
  end

  def input_email email
    fill_in 'email', :with => email
  end

  def input_mobile mobile
    fill_in 'phoneMobile', :with => mobile
  end

  def input_phoneAH phone
    fill_in 'phoneAH', :with => phone
  end

  def input_phoneBH phone
    fill_in 'phoneBH', :with => phone
  end

  def select_agent
    sleep 2
    find("table.zebra:nth-child(2) > tbody:nth-child(1) > tr:nth-child(2) > td:nth-child(2) > a:nth-child(1)").click
  end

########## Extended Form ##############################

  def input_street_number number
    fill_in 'propStreetNo', :with => number
  end

  def input_street street
    fill_in 'propStreetName', :with => street
  end

  def input_suburb suburb
    fill_in 'propSuburb', :with => suburb
  end

  def input_state state
    fill_in 'propState', :with => state
  end

  def input_postcode postcode
    fill_in 'propPostcode', :with => postcode
  end

  def select_type
    select "Apartment", :from => "resPropertyType"
  end

  def click_save
    click_button("Save & Close")
  end

  def select_min_price
    within all(".formField.jq_criteria")[1] do
      find("option[value='25000']").click
    end
  end

  def select_max_price
    within all(".formField.jq_criteria")[2] do
      find("option[value='300000']").click
    end
  end

  def add_list
    click_button(" >> ")
  end
end