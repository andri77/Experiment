
Given /^I am on Portplus homepage$/ do
  $home_page.visit_page $base_url
  $home_page.check_title
end

When /^as a user, I fill in my user name as "(.*?)"$/ do |userName|
  $home_page.fill_in_username userName
end

When /^as a user, I fill in my password as "(.*?)"$/ do |password|
  $home_page.fill_in_password password
end

  When /^I click login button$/ do
    $home_page.click_login
    end

When /^I should be directed to the login page$/ do
  page.current_url.should include 'cHelpdesk.controlpanel'
  $control_panel.check_title
end


