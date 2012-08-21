require 'xml_matchers/have_xpath/matcher'
require 'xml_matchers/have_xpath/text_matcher'
require 'xml_matchers/have_xpath'

module RSpecXML
  module XMLMatchers

    def have_xpath(xpath)
      HaveXPath.new(xpath)
    end

  end
end
