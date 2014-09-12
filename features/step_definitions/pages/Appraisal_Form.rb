class Appraisal_Form
  include Capybara::DSL

###################################### For Sale, Auction section

  def select_agent agent
    select agent, :from => "staffID_1"
  end

  def input_street_number number
    fill_in 'propStreetNo', :with => number
  end

  def input_street street
    fill_in 'propStreetName', :with => street
  end

  def select_suburb
    within '#suburb_id' do
      find("option[value='137115']").click
    end
  end

  def select_state state
    select state, :from => "propState"
  end

  def confirm_postcode
    sleep 2
    find('#propPostcode').value
  end

  def search_firstName firstName
    fill_in 'firstName', :with => firstName
  end

  def search_surname surname
    fill_in 'surname', :with => surname
  end

  def select_vendor
    # wait_for_css("#clientSelectedDiv", find("#div_check > div > table > tbody > tr:nth-child(3) > td:nth-child(2) > a ").click)

    wait_for_css("#div_check", "sleep 0.05")
    # find("#div_check > div > table > tbody > tr:nth-child(3) > td:nth-child(2) > a ").click
    find(".zebra > tbody:nth-child(1) > tr:nth-child(3) > td:nth-child(2) > a:nth-child(1)").click
  end

  def select_email
    find("#emailContact").click
  end

  def select_post
    find("#postContact").click
  end

  def input_phoneAH phone
    fill_in 'phoneAH', :with => phone
  end

  def input_phoneBH phone
    fill_in 'phoneBH', :with => phone
  end

  def input_email email
    fill_in 'email', :with => email
  end

  def input_bedrooms bedrooms
    fill_in 'numberBedrooms', :with => bedrooms
  end

  def input_bathrooms bathrooms
    fill_in 'numberBathrooms', :with => bathrooms
  end

  def input_garages garageSpaces
    fill_in 'garageSpaces', :with => garageSpaces
  end

  def input_carports carportSpaces
    fill_in 'carportSpaces', :with => carportSpaces
  end

  def input_toilets numberToilets
    fill_in 'numberToilets', :with => numberToilets
  end

  def set_study
    #this is a radio button, select by value
    find(:field, 'bStudy', with: 1).click
  end

  def agent_min_price agent_min_price
    fill_in 'agentPriceMin', :with => agent_min_price
  end

  def agent_max_price agent_max_price
    fill_in 'agentPriceMax', :with => agent_max_price
  end

  def client_min_price client_min_price
    fill_in 'clientPrice', :with => client_min_price
  end

  def client_max_price client_max_price
    fill_in 'clientPriceMax', :with => client_max_price
  end

  def land_size land_size
    fill_in 'landSize', :with => land_size
  end

  def land_rates land_rates
    fill_in 'cclRates', :with => land_rates
  end

  def select_priority priority
    find(:field, 'appraisal_priority', with: priority).click
  end

  def input_post_street street
    fill_in 'client_streetName_phys', :with => street
  end

  def input_post_suburb suburb
    fill_in 'client_suburb_phys', :with => suburb
  end

  def input_post_postcode postcode
    fill_in 'client_postcode_phys', :with => postcode
  end

  def select_category category
    select category, :from => "resPropertyTypeID"
  end

########################################## Rental Section

  def select_rental_agent agent
    select agent, :from => "staffID_1"
  end

  def weekly_rental weekly_rental
    fill_in 'rentWeek', :with => weekly_rental
  end

  def monthly_rental
    # find("#rentCalMonth").click.
    act_for_value(true, 'find("#rentCalMonth").value.should_not == ""', 'find("#rentWeek").click; sleep 0.5; find("#rentCalMonth").click')
    find("#rentCalMonth").value
  end

  def rental_bond bond
    fill_in 'bond', :with => bond
  end

  def display_price
    find("#displayPrice").value
  end

  ######################################### Lease Section

  def lease_price lease
    fill_in 'rentPerAnnum', :with => lease
  end

  def lease_term term
    fill_in 'rentTerm', :with => term
  end

  ######################################### Auction Section

  def auction_date
    all(".datepicker_trigger")[0].click
    find("td.datepicker_daysCell.datepicker_currentDay").click
  end

  def auction_time time
    fill_in 'auctionTime', :with => time
  end

  def click_save
    click_button("saveButtonBottom")
  end

  def low_price low_price
    fill_in 'priceLowest', :with => low_price
  end

  def high_price high_price
    fill_in 'priceHighest', :with => high_price
  end

  def rea_price rea_price
    fill_in 'realestate_com_au_priceSpecific', :with => rea_price
  end

end