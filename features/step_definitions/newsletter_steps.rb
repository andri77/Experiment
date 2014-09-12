Given /^as a staff member, I am able to create a newsletter$/ do
  within_window(last_window) do
    @control_panel.show_menu
    @control_panel.select_newsletter
    @control_panel.create_newsletter
  end
end

Given /^as a staff member, I am able to send a referral$/ do
  within_window(last_window) do
    @control_panel.show_menu
    @control_panel.select_referral
    @control_panel.send_referral
  end
end

Given /^I am able to select "(.*)" template$/ do |template|
  within_window(last_window) do
    find(:field, 'newsletter_template_id', with: '1').click
    click_button("Next")
  end
end

Given /^I fill in referral form with the following:$/ do |table|
  within_window(last_window) do
    mapped = Hash.new
    mapped = table_transpose(table)

    @referral_form.input_street_number mapped['number']
    @referral_form.input_street mapped['street']
    @referral_form.input_suburb mapped['suburb']
    @referral_form.select_state mapped['state']
    @referral_form.input_postcode mapped['postcode']

    @referral_form.input_owner mapped['fName']
    @referral_form.input_owner_surname mapped['lName']
    @referral_form.input_email mapped['email']
    @referral_form.input_mobile mapped['mobile']

    @referral_form.check_sms

    @referral_form.next
  end
  within_window(last_window) do
    analyze
  end
end

Given /^I fill in "(.*)" template with the following:$/ do |template, table|
  within_window(last_window) do
    mapped = Hash.new
    mapped = table_transpose(table)
    @newsletter_form.fill_email_subject mapped['emailSubject']
    @newsletter_form.fill_headline mapped['headline']
    # @newsletter_form.fill_greetings mapped['greetings']
    @newsletter_form.select_sold
    @newsletter_form.select_sneak_preview
    @newsletter_form.select_sale
    @newsletter_form.select_rental
    @newsletter_form.select_price_change

  end
end

Given /^I "(.*)" the newsletter$/ do |action|
  within_window(last_window) do
    if action == "preview"
      @newsletter_form.preview
    else
      @newsletter_form.send_email
      within_window(last_window) do
        all("input[name='category_id']").first.click #check 1st category box
        @newsletter_form.send_email
      end
    end
  end
end

Given /^I confirm the newsletter "(.*)" has the following:$/ do |template, table|
  within_window(last_window) do

    mapped = Hash.new
    mapped = table_transpose(table)


    all(".heading")[0].text.should == "Newsletter Headline"
    all(".heading")[1].text.should == "Recently Sold"
    all(".heading")[2].text.should == "Sneak Preview"
    all(".heading")[3].text.should == "Latest Listings"
    all(".heading")[4].text.should == "Recent price changes"
  end
end

Given /^I am able to confirm that the "(.*)" is being sent$/ do |title|
  within_window(last_window) do
    #check newsletter title
    all("tr.alt:nth-child(1) > td > a").first.text
    #Alternative: find("tr.alt:nth-child(1) > td:nth-child(1) > a:nth-child(1)").text.should == title
  end
end

Given /^I am able to view the newsletter$/ do
  within_window(last_window) do
    #click on view link
    all("tr.alt:nth-child(1) > td > a")[1].click
    #Alternative: find("tr.alt:nth-child(1) > td:nth-child(9) > a:nth-child(1)").click
  end
end

