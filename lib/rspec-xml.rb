require 'rubygems'
require 'bundler'
require 'bundler/setup'

require 'nokogiri'

module RSpecXML
end

require "rspec-xml/version"
require 'rspec-xml/xml_matchers'

RSpec.configure do |config|
  config.include RSpecXML::XMLMatchers
end
