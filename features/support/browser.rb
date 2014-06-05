
#if(page.driver.browser.browser.to_s == "internet_explorer")
#  page.driver.browser.manage.window.maximize
#end
#
#begin
#   click_link "test"
#rescue Selenium::WebDriver::Error:UnhandledAlertError => e
#   # may need to use the page.driver.wait_until method to wait until the alert present  other wise you may get the
#   # No alert is active (Selenium::WebDriver::Error::NoAlertPresentError)
#   #page.driver.browser.switch_to.alert.accept
#   #page.driver.browser.switch_to.alert.dismiss
#   click_link "test"
#end