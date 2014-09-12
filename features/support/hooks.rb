Before do
  p "Initiating scenario..."
  @timeStamp = Time.now.nsec.to_s.freeze
  require '.\features\step_definitions\pages\Control_Panel'
  require '.\features\step_definitions\pages\Client_Manager'
  require '.\features\step_definitions\pages\Client_Type'
  require '.\features\step_definitions\pages\Client_Form'
  require '.\features\step_definitions\pages\Vendor_Page'
  require '.\features\step_definitions\pages\Home_Page'
  require '.\features\step_definitions\pages\Property_Form'
  require '.\features\step_definitions\pages\Create_Property_Page'
  require '.\features\step_definitions\pages\Image_Uploader'
  require '.\features\step_definitions\pages\Residential_Page'
  require '.\features\step_definitions\pages\Listing_Rules'
  require '.\features\step_definitions\pages\Edit_Status'
  require '.\features\step_definitions\pages\Ofi_Form'
  require '.\features\step_definitions\pages\Appraisal_Form'
  require '.\features\step_definitions\pages\Appraisal_Rules'
  require '.\features\step_definitions\pages\Appraisal_Page'
  require '.\features\step_definitions\pages\Appraisal_Status'
  require '.\features\step_definitions\pages\Ofi_Feedback_Form'
  require '.\features\step_definitions\pages\Enquiries_Form'
  require '.\features\step_definitions\pages\Inspection_Form'
  require '.\features\step_definitions\pages\Newsletter_Form'
  require '.\features\step_definitions\pages\Referral_Form'
  require '.\features\step_definitions\pages\Staff_Form'

  puts "My browser is " + $brw
  @home_page = Home_Page.new
  @control_panel = Control_Panel.new
  @client_form = Client_Form.new
  @client_manager = Client_Manager.new
  @client_type = Client_Type.new
  @vendor_page = Vendor_Page.new
  @create_property = Create_Property_Page.new
  @property_form = Property_Form.new
  @image_uploader = Image_Uploader.new
  @residential_page = Residential_Page.new
  @listing_rules = Listing_Rules.new
  @edit_status = Edit_Status.new
  @ofi_form = Ofi_Form.new
  @appraisal_form = Appraisal_Form.new
  @appraisal_rules = Appraisal_Rules.new
  @appraisal_page = Appraisal_Page.new
  @appraisal_status = Appraisal_Status.new
  @ofi_feedback_form = Ofi_Feedback_Form.new
  @enquiries_form = Enquiries_Form.new
  @inspection_form = Inspection_Form.new
  @newsletter_form = Newsletter_Form.new
  @referral_form = Referral_Form.new
  @staff_form = Staff_Form.new
end

After do
  # page.driver.browser.window_handles.each do |handle|
  #   page.driver.browser.switch_to.window(handle)
  @home_page = nil
  @control_panel = nil
  @client_form = nil
  @client_manager = nil
  @client_type = nil
  @vendor_page = nil
  @create_property = nil
  @property_form = nil
  @image_uploader = nil
  @residential_page = nil
  @listing_rules = nil
  @edit_status = nil
  @ofi_form = nil
  @appraisal_form = nil
  @appraisal_rules = nil
  @appraisal_page = nil
  @appraisal_status = nil
  @enquiries_form = nil
  @inspection_form = nil
  @newsletter_form = nil
  @referral_form = nil
  @staff_form = nil
  page.driver.quit
    # page.execute_script "window.close()"
  # end
    sleep 2
  p "After Scenario "
end

at_exit do
  # exec `ruby report.rb`
  # visit 'http://localhost:8080/'
  GC.start
  p "End of Tests "

end