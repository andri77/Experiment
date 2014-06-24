Before do
  p "Initiating objects..."
  require 'debugger'
  require '.\features\step_definitions\pages\Control_Panel.rb'
  require '.\features\step_definitions\pages\Client_Manager.rb'
  require '.\features\step_definitions\pages\Client_Type.rb'
  require '.\features\step_definitions\pages\Client_Form.rb'
  require '.\features\step_definitions\pages\Vendor_Page.rb'
  require '.\features\step_definitions\pages\Home_Page.rb'
  require '.\features\step_definitions\pages\Residential_Form.rb'
  require '.\features\step_definitions\pages\Create_Property_Page.rb'
  require '.\features\step_definitions\pages\Image_Uploader.rb'
  require '.\features\step_definitions\pages\Residential_Page.rb'
  require '.\features\step_definitions\pages\Listing_Rules.rb'
  require '.\features\step_definitions\pages\Edit_Status.rb'
  require '.\features\step_definitions\pages\Ofi_Form.rb'
  require '.\features\step_definitions\pages\Create_Property_Page.rb'

  $home_page = Home_Page.new
  $control_panel = Control_Panel.new
  $client_form = Client_Form.new
  $client_manager = Client_Manager.new
  $client_type = Client_Type.new
  $vendor_page = Vendor_Page.new
  $create_property = Create_Property_Page.new
  $residential_form = Residential_Form.new
  $image_uploader = Image_Uploader.new
  $residential_page = Residential_Page.new
  $listing_rules = Listing_Rules.new
  $edit_status = Edit_Status.new
  $ofi_form = Ofi_Form.new
  $create_property_page = Create_Property_Page.new
end

After do
  # page.driver.browser.window_handles.each do |handle|
  #   page.driver.browser.switch_to.window(handle)
    page.driver.quit
    # page.execute_script "window.close()"
  # end
    sleep 2
  p "After Scenario "
end

at_exit do
  # exec `ruby report.rb`
  # visit 'http://localhost:8080/'
  p "End of Tests "
end