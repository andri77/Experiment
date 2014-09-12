  class Property_Form
    include Capybara::DSL

###################################### For Sale, Auction section

  def select_agent agent
    select agent, :from => "staffID_1"
  end

  def input_street street
    fill_in 'propStreetName', :with => street
  end

  def input_street_number number
    fill_in 'propStreetNo', :with => number
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

  def low_price low_price
    fill_in 'priceLowest', :with => low_price
  end

  def high_price high_price
    fill_in 'priceHighest', :with => high_price
  end

  def rea_price rea_price
    fill_in 'realestate_com_au_priceSpecific', :with => rea_price
  end

  def headline headline
    fill_in 'headline', :with => headline
  end

  def description description
    fill_in 'description', :with => description
  end

########################################## Rental Section

  def select_rental_agent agent
    select agent, :from => "staffID"
  end

  def weekly_rental weekly_rental
    fill_in 'rentWeek', :with => weekly_rental
  end

  def monthly_rental
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
    fill_in 'leasePrice', :with => lease
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
    click_button("Save")
  end


end