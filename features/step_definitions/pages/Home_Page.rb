class Home_Page
  include Capybara::DSL

  @page = new

  def self.check_title
    @page.has_title? 'Portplus Helpdesk'
  end

  def self.visit_page baseUrl
    @page.visit baseUrl
  end

  def self.fill_in_username userName
    @page.fill_in 'username', :with=> userName
  end

  def self.fill_in_password password
    @page.fill_in 'password', :with=> password
  end

  def self.click_login
    @page.find(:xpath, ".//*[@id='thisForm']/table/tbody/tr[4]/td[2]/input").click
  end

end