class Control_Panel
  include Capybara::DSL

  @page = new

  def self.check_heading
    @page.find(".heading").text.should == 'Control Panel'
  end

  def self.quick_search keyword
    @page.fill_in 'qSearch', :with=> keyword
  end
  #
  # def fill_in_password password
  #   fill_in 'password', :with=> password
  # end
  #
  # def click_login
  # find(:xpath, ".//*[@id='thisForm']/table/tbody/tr[4]/td[2]/input").click
  # end

end