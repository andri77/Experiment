require 'rubygems'
require 'selenium-webdriver'
require 'chunky_png'
require 'colorize'
require 'debugger'

def wait_for_css(element, closure)
  i = 0
  l = lambda {eval(closure)}
  while has_no_css?(element) && i < 10  do
    l.call
    sleep 1
    i +=1
  end
end

def wait_for_value(expected, closure)
  i = 0
  val = false
  l = lambda {eval(closure)}
  while val != expected && i < 10  do
    puts "In loop " + val.to_s
    val = get_value(l)
    puts "In loop " + val.to_s
    sleep 1
    i +=1
  end
end

def act_for_value(expected, closure, action)
  i = 0
  val = false
  l = lambda {eval(closure)}
  try = lambda {eval(action)}
  while val != expected && i < 10  do
    puts "In loop " + val.to_s
    val = get_value(l)
    try.call
    puts "In loop " + val.to_s
    sleep 1
    i +=1
  end
end

def get_value(l)
 begin
   l.call
   return true
 rescue Exception => e
   puts e.to_s.red
   return false
end
end

def wait_for_window(element)
  i = 0
  page.driver.window_handles.each do | handle |
    within_window(handle) do
  while has_no_css?(element) && i < 10  do
    sleep 1
    i +=1
  end
    end
    end
end

def find_window_handle(element)
  found = false
  my_handle = 0
  page.driver.window_handles.each do | handle |
    within_window(handle) do
      # while found == false && i < 10 do
      found = has_css?(element)
      puts found
      if found
        my_handle = handle
        end
    end

  end
  my_handle
end

def last_window
  lambda { page.driver.browser.window_handles.last }.call
end

def accept_alert
wait = Selenium::WebDriver::Wait.new ignore: Selenium::WebDriver::Error::NoAlertPresentError
alert = wait.until { page.driver.browser.switch_to.alert }
alert.accept
end

def reject_alert
  wait = Selenium::WebDriver::Wait.new ignore: Selenium::WebDriver::Error::NoAlertPresentError
  alert = wait.until { page.driver.browser.switch_to.alert }
  alert.reject
end


def pixel_diff(fileName)

  images = [
      ChunkyPNG::Image.from_file("./features/screenshots/#{fileName}.PNG"),
      ChunkyPNG::Image.from_file("./features/baseline_screenshots/#{fileName}.PNG")
  ]

  diff = []

  images.first.height.times do |y|
    images.first.row(y).each_with_index do |pixel, x|
      diff << [x,y] unless pixel == images.last[x,y]
    end
  end

  puts "pixels (total):     #{images.first.pixels.length}"
  puts "pixels changed:     #{diff.length}"
  difference = (diff.length.to_f / images.first.pixels.length) * 100
  puts "pixels changed (%): #{difference}%"

  x, y = diff.map{ |xy| xy[0] }, diff.map{ |xy| xy[1] }

if x != [] && y != []
  images.last.rect(x.min, y.min, x.max, y.max, ChunkyPNG::Color.rgb(0,255,0))
  images.last.save("./features/screenshots/diff/#{fileName}.PNG")
  difference.should_not >= 1.0
  begin
    difference.should_not >= 0.015
  rescue Exception => e
    puts e.to_s.red
    puts "WARNING!!!  IMAGE COMPARE DIFFERENCE IS BIGGER THAN THRESHOLD: #{difference}%".red
  end

  else difference == 0.0
    puts "No changes in image lay out".yellow
  end

end

def color_diff

  images = [
      ChunkyPNG::Image.from_file("./features/screenshots/#{fileName}.PNG"),
      ChunkyPNG::Image.from_file("./features/baseline_screenshots/#{fileName}.PNG")
  ]

  images.first.height.times do |y|
    images.first.row(y).each_with_index do |pixel, x|

      images.last[x,y] = rgb(
          r(pixel) + r(images.last[x,y]) - 2 * [r(pixel), r(images.last[x,y])].min,
          g(pixel) + g(images.last[x,y]) - 2 * [g(pixel), g(images.last[x,y])].min,
          b(pixel) + b(images.last[x,y]) - 2 * [b(pixel), b(images.last[x,y])].min
      )
    end

  end

  images.last.save("./features/screenshots/diff/#{fileName}.PNG")

  end

def image_resize(filePath)

image = ChunkyPNG::Image.from_file(filePath)

[0.5].each do |scale|
  resized_image = ChunkyPNG::Image.new((image.width * scale).round, (image.height * scale).round)

  resized_image.pixels.map!.with_index do |pixel, index|
    x, y = index % resized_image.width, (index / resized_image.width).floor
    image[x / scale, y / scale]
  end

  resized_image.save(filePath)
end
end


def analyze
analyze = Proc.new {
  debugger
  1
}
analyze.call
end

def table_transpose(table)
  mapped = {}
  transposed = table.raw.transpose
  transposed[0].each_with_index {|k,i|mapped[k] = transposed[1][i]}
  p mapped
end

def rescue_window(element)
begin
  find_window_handle(element)
rescue Exception => e
  puts e.to_s.red
end
  end

def debug_blank_ff
  @driver = Selenium::WebDriver.for :firefox
  analyze
  # @driver.find_element(:id, "andri")
  # @driver.find_element(:id, "andri").send_keys "C:\\Users\\aPurmawinata\\Pictures\\another error.JPG"
end

def attach_image(element, path)
  if element =~ /^./
    element = element.sub(".", "")
    puts "element " + element
  page.driver.browser.find_element(:class, element).send_keys File.expand_path(path)

  elsif element =~ /^#/
    element = element.sub("#", "")
    page.driver.browser.find_element(:id, element).send_keys File.expand_path(path)

  else
    puts "Element needs to be either an ID or a Class, example: #ID or .class "

  end
end

# Confirm Image Upload, atm still better to reside in helper methods
# def confirm_image(element, regex, width, height)
#   puts "Image URL " + find(element).native.attribute("src")
#   find(element).native.attribute("src").should =~ regex
#   find(element).native.attribute("width").should == width
#   find(element).native.attribute("height").should == height
# end




