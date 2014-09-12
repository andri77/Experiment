Given(/^I wish to create a Campaign Billing Quote$/) do
  within_window(last_window) do
    @control_panel.show_menu
    @control_panel.click_campaign_billing
    @control_panel.click_properties_without_campaigns
    analyze
  end

end

#When(/^I select the property$/) do
#  pending # express the regexp above with the code you wish you had
#end

#Then(/^I can select the property to have the bronze quote$/) do
#  pending # express the regexp above with the code you wish you had
#end