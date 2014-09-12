class Client_Type
  include Capybara::DSL

  def select_vendor
    check("isVendor")
  end

  def select_buyer
    check("isBuyer")
  end

  def select_tenant
    check("isTenant")
  end

  def select_landlord
    check("isLandlord")
  end

  def select_general
    check("isGeneral")
  end

  def select_vendor_rating
    select "low", :from => "vendorRating_id"
  end

  def select_buyer_rating
    select "low", :from => "buyerRating_id"
  end

  def select_tenant_rating
    select "low", :from => "tenantRating_id"
  end

  def select_landlord_rating
    select "low", :from => "landlordRating_id"
  end

  def select_general_rating
    select "low", :from => "generalRating_id"
  end

  def select_vendor_source
    select "Referral", :from => "vendorClientSource_id"
  end

  def select_buyer_source
    select "Referral", :from => "buyerClientSource_id"
  end

  def select_tenant_source
    select "Referral", :from => "tenantClientSource_id"
  end

  def select_landlord_source
    select "Referral", :from => "landlordClientSource_id"
  end

  def select_general_source
    select "Personal Friend", :from => "generalClientSource_id"
  end

  def select_vendor_staff
    select "Tony Horn", :from => "vendorStaffID"
  end

  def select_buyer_staff
    select "Tony Horn", :from => "buyerStaffID"
  end

  def select_tenant_staff
    select "Tony Horn", :from => "tenantStaffID"
  end

  def select_landlord_staff
    select "Tony Horn", :from => "landlordStaffID"
  end

  def select_general_staff
    select "Tony Horn", :from => "generalStaffID"
  end

  def select_category
    #this is a radio button, select by value
    find(:field, 'client_category', with: 'person').click
  end

  def click_next
    find(".ppBtn").click
  end

end