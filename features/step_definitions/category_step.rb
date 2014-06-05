When /^I click "(.*?)"$/ do |category|
  #page.execute_script('$('.level0.nav-1.active.parent').trigger("mouseenter")')
  page.find(:xpath, ".//*[@id='nav']/li[2]/a/span").click
  sleep 2
  if category == "Akoya" then
    sleep 3
    #find(:xpath, ".//*[@id='nav']/li[2]/ul/li[1]/a/span").click
    find(".level0 .first a").click
  elsif category == "Madison" then
    sleep 3
    #find(:xpath, ".//*[@id='nav']/li[2]/ul/li[2]/a/span").click
    find(".level0 .level1.nav-1-2 a").click
  elsif category == "Leather" then
    sleep 3
    #find(:xpath, ".//*[@id='nav']/li[2]/ul/li[3]/a").click
    find(".level0 .last a").click
  end
  sleep 2
end

Then /^I will arrive in category "(.*?)"$/ do | page |
  #on_page_with :category do |page|
  #  page.valid? == true
  #end
  #find(:xpath, "//title").text.should == page
  find("body").text.include? page
end