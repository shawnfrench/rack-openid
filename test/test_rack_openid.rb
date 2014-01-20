require 'minitest/autorun'
require 'minitest/spec'
require 'net/http'

require 'rack'
require 'rack/openid'
require 'rack/openid/simple_auth'

class TestOpenID < MiniTest::Unit::TestCase
  class MockRequest
    def params
      @params ||= {
        "openid.sig" => "a string with spaces",
        "openid.response_nonce" => "again with spaces!",
      }
    end
  end

  def test_sanitize_request
    mock_req = MockRequest.new
    Rack::OpenID.sanitize_request!(mock_req)

    assert_equal "a+string+with+spaces", mock_req.params["openid.sig"]
    assert_equal "again+with+spaces!", mock_req.params["openid.response_nonce"]
  end
end
