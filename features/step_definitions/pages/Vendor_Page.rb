class Vendor_Page
  include Capybara::DSL

  def check_title
    has_title? 'Portplus'
  end

  def click_editAll
    click_button("Edit All")
  end

  def click_physAddr
    find("#physAddrTooltip").click
  end

end