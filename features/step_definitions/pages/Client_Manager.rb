class Client_Manager
  include Capybara::DSL

    @page = new

  def self.check_title
    puts "I'm inside check_title "
    @page.has_title? 'Portplus'
  end

  def self.check_login
    @page.find("#loginTool").text
  end



end