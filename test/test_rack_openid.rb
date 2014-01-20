require File.expand_path("../helper", __FILE__)

describe Rack::OpenID do
  describe ".sanitize_request" do
    # https://github.com/grosser/rack-openid/pull/4
    it "fixes sig and nonce encoding issues" do
      params = {
        "openid.sig" => "a string with spaces",
        "openid.response_nonce" => "again with spaces!",
      }

      Rack::OpenID.sanitize_params!(params)

      params["openid.sig"].must_equal "a+string+with+spaces"
      params["openid.response_nonce"].must_equal "again+with+spaces!"
    end
  end
end
