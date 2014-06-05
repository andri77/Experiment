Then /^I will get "(.*?)" in search result page$/ do |result|
  on_page_with :results do |page|
    page.item.should == "1 Item(s)"
    page.product.should == result
    page.valid?.should == true
  end
end

#And /^I take a screenshot$/ do
#  name =  scenario.name.gsub!(' ', '')#.gsub!(/[\?\.\&=\-\/\\\(\),\'\"\|]/, '')
#  File.open("features/screenshots/#{name}.png", 'wb') { |f| f << screenshot_as(:png) }
#  end