$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
name = "rack-openid"
require "rack/openid/version"

Gem::Specification.new name, Rack::OpenID::VERSION do |s|
  s.summary = "Provides a more HTTPish API around the ruby-openid library"
  s.authors = ["Michael Grosser", "Joshua Peek"]
  s.email = "michael@grosser.it"
  s.homepage = "https://github.com/grosser/#{name}"
  s.files = `git ls-files lib`.split("\n")
  s.license = "MIT"
  key = File.expand_path("~/.ssh/gem-private_key.pem")
  if File.exist?(key)
    s.signing_key = key
    s.cert_chain = ["gem-public_cert.pem"]
  end

  s.add_runtime_dependency "rack", ">=1.1.0"
  s.add_runtime_dependency "ruby-openid", ">= 2.1.8"
end
