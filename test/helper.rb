require 'bundler/setup'
require 'minitest/autorun'
require 'minitest/spec'
require 'net/http'

require 'rack'
require 'ostruct'
require 'rack/openid'
require 'rack/openid/simple_auth'

log = Logger.new(STDOUT)
log.level = Logger::WARN
OpenID::Util.logger = log
