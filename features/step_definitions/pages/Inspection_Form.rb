class Inspection_Form
  include Capybara::DSL

###################################### For Sale, Auction section

  def select_agent
    find("#div_check > div:nth-child(2) > table:nth-child(1) > tbody:nth-child(1) > tr:nth-child(2) > td:nth-child(2) > a").click
  end

  def input_agent agent
    fill_in 'client_name', :with => agent
  end

  def select_suburb
    within '#suburb_id' do
      find("option[value='137115']").click
    end
  end

  # all("#masterT table tbody tr td select option")[1].click
  # "ok"
  # (rdb:1) click_button("#ppbtn6586")

  def select_source
    select "Open Home", :from => "enquirySource_id_1"
  end

#   def select_state state
#     select state, :from => "propState"
#   end
#
#   def confirm_postcode
#     sleep 2
#     find('#propPostcode').value
#   end
#
#   def search_firstName firstName
#     fill_in 'firstName', :with=> firstName
#   end
#
#   def search_surname surname
#     fill_in 'surname', :with=> surname
#   end
#
#   def select_vendor
#     # wait_for_css("#clientSelectedDiv", find("#div_check > div > table > tbody > tr:nth-child(3) > td:nth-child(2) > a ").click)
#
#     wait_for_css("#div_check", "sleep 0.05")
#     # find("#div_check > div > table > tbody > tr:nth-child(3) > td:nth-child(2) > a ").click
#     find(".zebra > tbody:nth-child(1) > tr:nth-child(3) > td:nth-child(2) > a:nth-child(1)").click
#   end
#
#   def select_email
#     find("#emailContact").click
#   end
#
#   def select_post
#     find("#postContact").click
#   end
#
#   def input_phoneAH phone
#     fill_in 'phoneAH', :with=> phone
#   end
#
#   def input_phoneBH phone
#     fill_in 'phoneBH', :with=> phone
#   end
#
#   def input_email email
#     fill_in 'email', :with=> email
#   end
#
#   def input_bedrooms bedrooms
#     fill_in 'numberBedrooms', :with=> bedrooms
#   end
#
#   def input_bathrooms bathrooms
#     fill_in 'numberBathrooms', :with=> bathrooms
#   end
#
#   def agent_min_price agent_min_price
#     fill_in 'agentPriceMin', :with=> agent_min_price
#   end
#
#   def agent_max_price agent_max_price
#     fill_in 'agentPriceMax', :with=> agent_max_price
#   end
#
#   def client_min_price client_min_price
#     fill_in 'clientPrice', :with=> client_min_price
#   end
#
#   def client_max_price client_max_price
#     fill_in 'clientPriceMax', :with=> client_max_price
#   end
#
#   def land_size land_size
#     fill_in 'landSize', :with=> land_size
#   end
#
#   def land_rates land_rates
#     fill_in 'cclRates', :with=> land_rates
#   end
#
#   def select_priority priority
#     find(:field, 'appraisal_priority', with: priority).click
#   end
#
#   def input_post_street street
#     fill_in 'client_streetName_phys', :with=> street
#   end
#
#   def input_post_suburb suburb
#     fill_in 'client_suburb_phys', :with=> suburb
#   end
#
#   def input_post_postcode postcode
#     fill_in 'client_postcode_phys', :with=> postcode
#   end
#
# ########################################## Rental Section
#
#   def select_rental_agent agent
#     select agent, :from => "staffID"
#   end
#
#   def weekly_rental weekly_rental
#     fill_in 'rentWeek', :with=> weekly_rental
#   end
#
#   def monthly_rental
#     # find("#rentCalMonth").click.
#     act_for_value(true, 'find("#rentCalMonth").value.should_not == ""', 'find("#rentWeek").click; sleep 0.5; find("#rentCalMonth").click')
#     find("#rentCalMonth").value
#   end
#
#   def rental_bond bond
#     fill_in 'bond', :with=> bond
#   end
#
#   def display_price
#     find("#displayPrice").value
#   end
#
#   ######################################### Lease Section
#
#   def lease_price lease
#     fill_in 'leasePrice', :with=> lease
#   end
#
#
#   ######################################### Auction Section
#
#   def auction_date
#     all(".datepicker_trigger")[0].click
#     find("td.datepicker_daysCell.datepicker_currentDay").click
#   end
#
#   def auction_time time
#     fill_in 'auctionTime', :with=> time
#   end
#
#   def click_save
#     click_button("saveButtonBottom")
#   end


end