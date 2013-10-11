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
  cert = File.expand_path("~/.ssh/gem-private-key-grosser.pem")
  if File.exist?(cert)
    s.signing_key = cert
    s.cert_chain = ["gem-public_cert.pem"]
  end

  s.add_runtime_dependency "rack", ">=1.1.0"
  s.add_runtime_dependency "ruby-openid", ">= 2.1.8"
end
