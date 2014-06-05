
# When /I search for "(.*)"/ do |query|
#   @browser.text_field(:name, 'q').set(query)
#   @browser.button(:name, 'btnG').click
# end

Then /I should see/ do |text|
  @browser.text.should =~ /#{text}/m
end
