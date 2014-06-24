class Home_Page
  include Capybara::DSL

  def check_title
    has_title? 'Portplus Helpdesk'
  end

  def visit_page baseUrl
    visit baseUrl
  end

  def fill_in_username userName
    fill_in 'username', :with=> userName
  end

  def fill_in_password password
    fill_in 'password', :with=> password
  end

  def click_login
    find(:xpath, ".//*[@id='thisForm']/table/tbody/tr[4]/td[2]/input").click
  end

end
