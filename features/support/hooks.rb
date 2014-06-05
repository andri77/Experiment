Before do
  # @browser = PageObject::PersistantBrowser.get_browser
  p "I'm before "
end

at_exit do
  # PageObject::PersistantBrowser.quit
  p "I'm after "
end