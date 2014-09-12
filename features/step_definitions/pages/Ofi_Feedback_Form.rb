class Ofi_Feedback_Form
  include Capybara::DSL

  def input_first_name firstName
    fill_in 'clientName_1', :with => firstName
  end

  def input_last_name lastName
    fill_in 'clientLastName_1', :with => lastName
  end

  def input_mobile mobile
    fill_in 'phone_1', :with => mobile
  end

  def input_email email
    fill_in 'email_1', :with => email
  end

  def select_source
    select "Open Home", :from => "enquirySource_id_1"
  end

  def select_comment_type
    sleep 1
    find("#commentType_id_1").click
    find("#commentType_id_1_chk_3").click
  end

  def select_client_attributes
    find("#internalAttribute_id_1").click
    find("#internalAttribute_id_1_chk_1").click
  end


  def click_save
    click_button("Save >")
  end

end