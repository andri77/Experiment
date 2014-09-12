require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'
require 'rake'
# require 'rails/all'

namespace :cucumber do

  Cucumber::Rake::Task.new(:rerun, 'Rerun failed cucumber tests') do |t|
    if File.exist?('tmp/rerun.txt')
      File.open('tmp/rerun.txt').each(sep="\r") do |line|
      puts "Re-run failing test:" + line
      end
      t.profile = 'rerun'
end

  end
end

namespace :cucumber do

  Cucumber::Rake::Task.new(:rerunjson, 'Rerun failed cucumber tests') do |t|
    if File.exist?('tmp/rerun.txt')
      File.open('tmp/rerun.txt').each(sep="\r") do |line|
        puts "Re-run failing test:" + line
      end
      t.profile = 'rerun-json'
    end

  end
end

namespace :cucumber do

  Cucumber::Rake::Task.new(:smoke_rerun, 'Rerun failed cucumber tests') do |t|
    if File.exist?('tmp/rerun.txt')
      File.open('tmp/rerun.txt').each(sep="\r") do |line|
        puts "Re-run failing test:" + line
      end
      t.profile = 'smoke_rerun'
    end

  end
end


desc 'regression tests, takes 2 arguments: environment and browser'
task :regression, [:env, :browser] do |t, args|
  puts args
Cucumber::Rake::Task.new(:regression) do | t |
  t.cucumber_opts = ["-t","@regression","-t","~@wip","TEST_ENV=#{args[:env]}","BROWSER=#{args[:browser]}"]
end
Rake::Task[:regression].invoke
end

desc 'parallel tests, takes 2 arguments: environment and browser'
task :parallel do
 system('parallel_cucumber features -n 6 -o "--tags @regression --t ~@wip TEST_ENV=qa BROWSER=chrome -p parallel"')
end

desc 'Re-run failing parallel tests'
task :rerun_parallel do
  system('cucumber @tmp/cucumber_failures.log')
end


desc 'start-up selenium grid for chrome and firefox'
task :startup_grid do

  spawn(
   'cucumber features --t @smoke TEST_ENV=qa BROWSER=grid-ff'
  )

  spawn(
    'cucumber features --t @smoke TEST_ENV=qa BROWSER=grid-chrome'
  )
  # pid1 = Process.spawn 'java -jar selenium-server-standalone-2.42.2.jar -role node -hub http://10.250.65.97:4444/grid/register -port 8989 -browser browserName="chrome",platform=WINDOW'
  # pid2 = Process.spawn 'java -jar selenium-server-standalone-2.42.2.jar -role node -hub http://10.250.65.97:4444/grid/register -port 5555 -browser browserName="firefox",platform=WINDOWS'
  # puts pid1
  # puts pid2

  # system('java -jar selenium-server-standalone-2.42.2.jar -role node -hub http://10.250.65.97:4444/grid/register -port 8989 -browser browserName="chrome",platform=WINDOW')
  # system('java -jar selenium-server-standalone-2.42.2.jar -role node -hub http://10.250.65.97:4444/grid/register -port 5555 -browser browserName="firefox",platform=WINDOWS')

#   def doit(x)
#     sleep(rand(10))
#     exec(x)
#   end
#
#   thingstodo = ['java -jar selenium-server-standalone-2.42.2.jar -role node -hub http://10.250.65.97:4444/grid/register -port 8989 -browser browserName="chrome",platform=WINDOW',
#                 'java -jar selenium-server-standalone-2.42.2.jar -role node -hub http://10.250.65.97:4444/grid/register -port 5555 -browser browserName="firefox",platform=WINDOWS']
#   tasklist = []
#
# # Set the threads going
#
#   thingstodo.each { |thing|
#     task = Thread.new(thing) { |this| doit(this) }
#     tasklist << task
#   }
#
# # Wait for the threads to finish
#
#   tasklist.each { |todo|
#    todo.join
#   }


end

namespace :cucumber do
  Cucumber::Rake::Task.new(:selenium, 'Running cucumber tests') do |t|
    t.profile = 'selenium'
  end
end

namespace :cucumber do
  Cucumber::Rake::Task.new(:seleniumjson, 'Running cucumber tests with json report') do |t|
    t.profile = 'selenium-json'
  end
end

namespace :cucumber do
  Cucumber::Rake::Task.new(:smoke, 'Running smoke tests') do |t|
    t.profile = 'smoke'
  end
end

namespace :cucumber do
  Cucumber::Rake::Task.new(:smoke, 'Re-run failed smoke tests') do |t|
    t.profile = 'smoke_rerun'
  end
end

# namespace :cucumber do
#   Cucumber::Rake::Task.new(:parallel, 'Running cucumber tests') do |t|
#     t.profile = 'parallel'
#   end
# end

namespace :cucumber do
  desc 'Run smoke tests and rerun failed tests'
  task :smoke_with_retry do
    system("rm -rf public/smoke_rerun.*")
    selenium_successful = run_rake_task("cucumber:smoke")
    rerun_successful = true
    unless selenium_successful
      rerun_successful = run_rake_task("cucumber:smoke_rerun")
    end
    unless selenium_successful || rerun_successful
      raise 'Smoke tests failed'
    end
  end
end

namespace :cucumber do
  desc 'Run regression tests and rerun failed tests'
  task :regression_with_retry do
    system("rm -rf public/rerun.*")
    selenium_successful = run_rake_task("cucumber:selenium")
    rerun_successful = true
    unless selenium_successful
      rerun_successful = run_rake_task("cucumber:rerun")
    end
    unless selenium_successful || rerun_successful
      raise 'Cucumber tests failed'
    end
  end
end

namespace :cucumber do
  desc 'Run regression tests and rerun failed tests with json reports'
  task :regression_json_report do
    system("rm -rf public/rerun.*")
    selenium_successful = run_rake_task("cucumber:seleniumjson")
    rerun_successful = true
    unless selenium_successful
      rerun_successful = run_rake_task("cucumber:rerunjson")
    end
    unless selenium_successful || rerun_successful
      raise 'Cucumber tests failed'
    end
  end
  # system("cat public/rerun.json >> public/cucumber.json")
end

namespace :cucumber do
  desc 'Run parallel tests and rerun failed tests'
  task :parallel_with_retry do
    system("rm -rf public/rerun.*")
    selenium_successful = run_parallel_task("parallel")
    puts "selenium_successful" + selenium_successful
    rerun_successful = true
    unless selenium_successful
      rerun_successful = run_rake_task("rerun_parallel")
    end
    unless selenium_successful || rerun_successful
      raise 'Cucumber tests failed'
    end
  end
end

def run_rake_task(name)
  begin
    Rake::Task[name].invoke
  rescue Exception => e
    return false
  end
  true
end

def run_parallel_task(name)
  begin
    result = Rake::Task[name].invoke
  rescue Exception => e
    return false
  end
  true
end

