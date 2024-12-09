require_relative 'test_helper'

class PalindromeTest < Minitest::Test
    include Rack::Test::Methods

    def app
        Sinatra::Application
    end

    def test_form_presence
        get '/palindrome'
        assert last_response.ok?
        assert doc(last_response).at_css('form')
    end

    def test_non_palindrome_submission
        post '/check', {phrase: "Not a palindrome."}
        assert_includes doc(last_response).at_css('p').content,
                        "is not a palindrome. "
        assert doc(last_response).at_css('form')
    end

    def test_palindrome_submission
        post '/check', {phrase: "RaceCar."}
        assert_includes doc(last_response).at_css('p').content,
                        "is a palindrome! "
    end
end