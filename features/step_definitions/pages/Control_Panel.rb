class Control_Panel
  include Capybara::DSL

  def check_title
    has_title? 'Portplus Helpdesk'
  end

  def quick_search keyword
    fill_in 'qSearch', :with => keyword
  end

  def smart_search name
    find('#search').set name
  end

  def click_main_button
    find("td #td_add").click
  end

  def add_client
    # find("#clientButton").click
    page.execute_script("$('#clientButton').click()")
  end

  def add_property
    page.execute_script("$('#propertyButton').click()")
  end

  def add_quickBuy
    page.execute_script("$('#addEnquiryButton').click()")
  end

  def add_quickSell
    page.execute_script("$('#addSellingButton').click()")
  end

  def add_ofi
    page.execute_script("$('#addOfiButton').click()")
  end

  def add_ofiFeedback
    page.execute_script("$('#addOfiFeedbackButton').click()")
  end

  def add_inspectionFeedback
    page.execute_script("$('#addPrivateFeedbackButton').click()")
  end

  def click_agent
    within_frame(find("#results #resultIframeWrapper #resultIframe")) do
      all("#smartSearchResultTable .hilite").first.click
    end
  end

  def show_menu
    find("#menuTab").click
  end

  def select_newsletter
    find("#enewsP").click
  end

  def create_newsletter
    find("#enewsC > div > a:nth-child(2)").click
  end

  def select_referral
    find("#refeP").click
  end

  def setup_other_agents
    find("#refeC > div > a:nth-child(1)").click
  end

  def setup_commission
    find("#refeC > div > a:nth-child(3)").click
  end

  def setup_referral
    find("#refeC > div > a:nth-child(5)").click
  end

  def send_referral
    find("#refeC > div > a:nth-child(7)").click
  end

  def referral_received
    find("#refeC > div > a:nth-child(9)").click
  end

  def referral_sent
    find("#refeC > div > a:nth-child(11)").click
  end

  def click_admin
    find("#offcP").click
  end

  def click_campaign_billing
    find("#campP").click
  end

  def click_properties_without_campaigns
    find("#PropertieswithoutCampaigns").click
  end

  def add_staff
    find("#offcC > div:nth-child(1) > a:nth-child(2)").click
  end

  def click_tool
    find("#toolsP").click
  end

  def submit_password master_password
    fill_in "masterPwd", :with => master_password
    find("#somp > table:nth-child(1) > tbody:nth-child(1) > tr:nth-child(2) > td:nth-child(2) > img:nth-child(1)").click
  end

  # Ensuring all elements in the iframe are loaded
  def page_loaded
    within_frame(find("#clientSummaryIframe")) do
      find("#div_diaries")
    end
  end

  def whiteboard_1stproperty
    within_window(last_window) do
      within_frame(find("form#clmHubForm div#sortable_sections.ui-sortable div#whiteboard.jqSortable #whiteboardIframe")) do
        find("tr.alt:nth-child(1) td:nth-child(3) a:nth-child(1)").click
      end
    end
  end

end
