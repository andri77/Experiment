class Client_Manager
  include Capybara::DSL

  def check_title
    has_title? 'Portplus'
  end

  def check_login
    find("#loginTool").text
  end

  def staff_login
    find("#loginTool").click
  end

end