class Listing_Rules
  include Capybara::DSL

  def check_letter
    find("#jobID_check_8").click
  end

  def approve_selected
    all("[value='Approve selected']")[0].click
    # click_button("Approve selected")
  end

  def close_window
    find("span.ui-icon.ui-icon-closethick").click
  end

end