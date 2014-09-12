class Appraisal_Page
  include Capybara::DSL

  def get_address
    all(".piece_base.piece_cap.piece_text_appraisal.piece_border_appraisal.piece_bg_appraisal")[0].text
  end

  def edit_all
    all(".ppBtn.v1")[5].native.attribute("title").should == ("Edit All Appraisal Details")
    all(".ppBtn.v1")[5].click
    # click_button("Edit All")
  end

  def edit_status
    find(".list-propdetails-section-two .bold.color-text-appraisal .color-text-appraisal").click
  end

  def check_display #Active Inactive
    find(".list-propdetails-section-two > li:nth-child(2) > table:nth-child(1) > tbody:nth-child(1) > tr:nth-child(1) > td:nth-child(2) > a:nth-child(1)").text
  end

  def check_status #prospective sold
    find(".status-img").native.attribute("class")
  end

end