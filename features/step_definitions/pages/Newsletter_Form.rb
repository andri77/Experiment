class Newsletter_Form
  include Capybara::DSL

  def fill_email_subject emailSubject
    fill_in 'emailSubject', :with => emailSubject
  end

  def fill_headline headline
    fill_in 'greetingsHeadline', :with => headline
  end

  def fill_greetings greetings
    within_frame(find("#greetingsTxt___Frame")) do
      find("#xEditingArea").set greetings
    end
  end

  def select_sold
    find("#recentlySoldSource > option:nth-child(1)").click
    all("input[value='>']")[0].click
  end

  def select_sneak_preview
    find("#sneakPreviewSource > option:nth-child(1)").click
    all("input[value='>']")[1].click
  end

  def select_sale
    find("#latestListingsSaleSource > option:nth-child(1)").click
    all("input[value='>']")[2].click
  end

  def select_rental
    find("#latestListingsRentalSource > option:nth-child(1)").click
    all("input[value='>']")[3].click
  end

  def select_price_change
    find("#priceChangesSource > option:nth-child(1)").click
    all("input[value='>']")[4].click
  end

  def preview
    click_button("Preview Newsletter")
  end

  def send_email
    click_button("Send Now")
  end

end
