class Appraisal_Rules
  include Capybara::DSL

  def select_first_job
    find('#selectAllJobs')
    all("#jobID_check_1")[0].click
  end

  def approve_selected
    all('.ppBtn.v1')[0]
  end

  def close_window
    find("span.ui-icon.ui-icon-closethick").click
  end

end