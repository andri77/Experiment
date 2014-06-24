require 'sinatra'

set :port, 8080

get '/' do
  File.read(File.join(settings.public_folder, 'results.html'))
end