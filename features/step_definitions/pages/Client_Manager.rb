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

  def get_password
    find("#tdbody > table:nth-child(3) > tbody:nth-child(1) > tr:nth-child(1) > td:nth-child(1) > table:nth-child(4) > tbody:nth-child(1) > tr:nth-child(5) > td:nth-child(2)").text
  end

end