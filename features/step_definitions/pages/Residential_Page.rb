class Residential_Page
  include Capybara::DSL

  def get_address
    find(".piece_base.piece_cap.piece_text_property.piece_border_property.piece_bg_property .font12").text
  end

  def edit_all
    click_button("Edit All")
  end

  def edit_status
    all("ul.list-propdetails-section-two .col-first .bold.color-text-property .color-text-property")[0].click
  end

  def check_display
    all("ul.list-propdetails-section-two li")[2].native.attribute("class")
  end

  def confirm_withdrawn
  find("li.first.status-img.status-withdrawn a div").visible?
  end

end