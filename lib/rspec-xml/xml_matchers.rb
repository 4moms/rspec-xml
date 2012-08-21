root =  File.dirname(__FILE__)
require "#{root}/xml_matchers/have_xpath/matcher"
require "#{root}/xml_matchers/have_xpath/text_matcher"
require "#{root}/xml_matchers/have_xpath"

module RSpecXML
  module XMLMatchers

    def have_xpath(xpath)
      HaveXPath.new(xpath)
    end

  end
end
