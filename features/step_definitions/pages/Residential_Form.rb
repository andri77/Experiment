class Residential_Form
  include Capybara::DSL

###################################### For Sale, Auction section

  def select_agent agent
    select agent, :from => "staffID_1"
  end

  def input_street street
    fill_in 'propStreetName', :with=> street
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
    fill_in 'numberBedrooms', :with=> bedrooms
  end

  def input_bathrooms bathrooms
    fill_in 'numberBathrooms', :with=> bathrooms
  end

  def low_price low_price
    fill_in 'priceLowest', :with=> low_price
  end

  def high_price high_price
    fill_in 'priceHighest', :with=> high_price
  end

  def rea_price rea_price
    fill_in 'realestate_com_au_priceSpecific', :with=> rea_price
  end

########################################## Rental Section

  def select_rental_agent agent
    select agent, :from => "staffID"
  end

  def weekly_rental weekly_rental
    fill_in 'rentWeek', :with=> weekly_rental
  end

  def monthly_rental
    find("#rentCalMonth").click
    find("#rentCalMonth").value
  end

  def rental_bond bond
    fill_in 'bond', :with=> bond
  end

  def display_price
    find("#displayPrice").value
  end

  ######################################### Lease Section

  def lease_price lease
    fill_in 'leasePrice', :with=> lease
  end

  def click_save
    click_button("Save")
  end



end