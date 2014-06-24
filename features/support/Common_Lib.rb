require 'rubygems'
require 'selenium-webdriver'
require 'chunky_png'
require 'colorize'
require 'debugger'


###########################################################################
  def close_pop_up_window browser, str_win_title
=begin
    * Name:   close_pop_up_window
    * Description: This method use to to close pop-up window
=end
    begin
      hook    # Close it
      browser.switch_to.window(str_win_title)
      browser.close
      strDetails = "close #{str_win_title} pop-up window successfully"
      puts strDetails
    rescue Exception => e
      puts e
    end
  end
###########################################################################
def close_all_popups
=begin
    * Name:   close_pop_up_window
    * Description: This method use to to close all pop-up window
=end
  begin
    page.driver.browser.window_handles
    page.driver.browser.window_handles.each do |handle|
      page.driver.browser.switch_to.window(handle)
      page.driver.browser.close()
      # page.execute_script "window.close()"
    end
  rescue Exception => e
    puts e
  end
end
###########################################################################
def wait_for_element_present how, objObject, timeOut=$timeout
=begin
    * Name:   wait_for_element_present
	  * Note: Add "how" variable to this function can be used for both xpath and css
    *       how: :xpath, :css, :id, :name
    * Usage: +wait_for_element_present "content",CONTENT_TO_FIND,10 => find content on web page
             +wait_for_element_present :id,OBJ_ID,10     => find element by id
             +wait_for_element_present :name,OBJ_NAME,10     => find element by name
             +wait_for_element_present :css,OBJ_CSS,10     => find element by css
             +wait_for_element_present :xpath,OBJ_XPath,10     => find element by xpath

=end
  begin
    wait_for_it = Selenium::WebDriver::Wait.new(:timeout => timeOut)
    case how
      when "content"
        wait_for_it.until { page.driver.browser.find_element(:xpath, "//*[contains(text(),'#{objObject}')]").displayed?}
        strDetails = "Content " + objObject + " found"
        puts strDetails
      else
        wait_for_it.until { page.driver.browser.find_element(how, objObject).displayed?}
        strDetails = "Object " + objObject + " found"
        puts strDetails
    end
    sleep 5
  rescue Exception => e
    puts e
  end
  end

def wait_for_css(element, closure)
  i = 0
  clos = Proc.new{ closure }
  while has_no_css?(element) && i < 10  do
    clos.call
    sleep 1
    i +=1
  end
end

def last_window
  lambda { page.driver.browser.window_handles.last }.call
end

def accept_alert
wait = Selenium::WebDriver::Wait.new ignore: Selenium::WebDriver::Error::NoAlertPresentError
alert = wait.until { page.driver.browser.switch_to.alert }
alert.accept
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








