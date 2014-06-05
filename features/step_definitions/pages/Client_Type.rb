class Client_Type
  include Capybara::DSL

    @page = new

  def self.select_vendor
    @page.check("isVendor")
  end

  def self.select_vendor_rating
    @page.select "low", :from => "vendorRating_id"
  end

  def self.select_vendor_source
    @page.select "Referral", :from => "vendorClientSource_id"
  end

  def self.select_vendor_staff
    @page.select "Tony Horn", :from => "vendorStaffID"
  end

  def self.select_category
    #this is a radio button, select by value
    @page.find(:field, 'client_category', with: 'company').click
  end

  def self.click_next
    @page.find(".ppBtn.v1").click
 end

end