require 'sinatra'

get '/' do
    'Goodbye, world!'
end

post '/submit' do
    'Form submitted!'
end

Warning.ignore(/Rack::Logger/)
