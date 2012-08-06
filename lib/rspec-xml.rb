require "rspec-xml/version"

Bundler.require
require 'rspec/xml_matchers'

RSpec.configure do |config|
  config.include XMLMatchers
end
