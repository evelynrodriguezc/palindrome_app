ENV['RACK_ENV'] = 'test'

require_relative '../app'
require 'rack/test'
require 'nokogiri'
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

# Returns a Nokogiri::HTML::Document from a Rack::Test::Methods last_response
def doc(response)
    Nokogiri::HTML(response.body)
end