class Control_Panel
  include Capybara::DSL

  def check_title
    has_title? 'Portplus Helpdesk'
  end

  def quick_search keyword
    fill_in 'qSearch', :with=> keyword
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

  def add_ofi
    # find("#clientButton").click
    page.execute_script("$('#addOfiButton').click()")
  end

  def add_property
    page.execute_script("$('#propertyButton').click()")
  end

  def click_agent
    within_frame(find("#results #resultIframeWrapper #resultIframe")) do
      all("#smartSearchResultTable .hilite").last.click
    end
  end

  # Ensuring all elements in the iframe are loaded
  def  page_loaded
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
