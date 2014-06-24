


# After do |scenario|
# #need to write as a byte instead of IP#puts
# if scenario.failed?
#   name =  scenario.name.gsub!(' ', '')#.gsub!(/[\?\.\&=\-\/\\\(\),\'\"\|]/, '')
#   File.open("features/screenshots/#{name}.jpeg", 'wb') do |f|
#     f.write(Base64.decode64(page.driver.browser.screenshot_as(:base64)))
#   end
# end
# embed("#{scenario.__id__}.jpeg", "image/jpeg", "SCREENSHOT")
# # page.driver.browser.save_screenshot("features/screenshots/#{scenario.__id__}.jpeg")
# # embed("#{scenario.__id__}.jpeg", "image/jpeg", "SCREENSHOT")
# end

After do |scenario|
  if scenario.failed?
    page.driver.browser.save_screenshot("./features/screenshots/failures/#{scenario.name}.png")
    embed("./features/screenshots/failures/#{scenario.name}.png", "image/png")
  end

end

#at_exit do
#ARGV.each do |a|
#if a =~ /\.htm(l)?/
#   file = File.open(a, 'r')
#   new_file = ""
#   while (line = file.gets)
#     if line.match(/lessthan/) and line.match(/greaterthan\<\/pre\>/)
#      new_file = new_file + line.gsub!(/lessthan/, "<").gsub!(/greaterthan\<\/pre\>/, ">")
#     else
#      new_file = new_file + line
#     end
#   end
#   file.close
#
#   File.open(a, "w") do |f|
#     f.write(new_file)
#   end
#end
#end
#end


#
##Works!!
#After do |scenario|
#if scenario.failed?
#   File.open("./features/screenshots/#{scenario.name}.jpeg",'wb') do |f|
#      f.write(Base64.decode64(page.driver.browser.screenshot_as(:base64)))
#   end
#end
#end
