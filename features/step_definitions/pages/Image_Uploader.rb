class Image_Uploader
  include Capybara::DSL

  def add_image
    click_button("addButton")
  end

  def click_next
    # click_button("nextButton")
    page.execute_script("$('#nextButton').click()")
  end

end