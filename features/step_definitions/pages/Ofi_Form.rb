class Ofi_Form
  include Capybara::DSL

  def search_property property
    fill_in 'property_searchString', :with => property
  end

  def click_search
    click_button("Search >")
  end

  def select_property
    find("form > table > tbody > tr > td > table:nth-child(4) > tbody > tr > td:nth-child(1) > select > option:nth-child(1)").click
  end

  def add_list
    click_button("Add")
  end

  def click_next
    click_button("Next")
  end

end