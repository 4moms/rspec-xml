module RSpecXML
  module XMLMatchers
    class HaveXPath
        
      private

      class Matcher
        def initialize(options={})
          self.xpath = options[:xpath]
        end

        def matches?(xml)
          ::Nokogiri::XML(xml).xpath(@xpath).count > 0
        end

        def failure_message_for_should
          "expected #{xpath} to exist" 
        end

        def failure_message_for_should_not
          "expected #{xpath} to not exist"
        end

        attr_accessor :xpath
      end

      class TextMatcher

        def initialize(options)
          self.xpath = options[:xpath]
          self.text = options[:text]
        end

        def matches?(xml)
          ::Nokogiri::XML(xml).xpath(xpath).text == text
        end

        def failure_message_for_should
          "expected #{xpath} to contain #{text}"
        end

        def failure_message_for_should_not
          "expected #{xpath} to contain #{text}"
        end

        private

        attr_accessor :text, :xpath
      end
    end

    def have_xpath(xpath)
      HaveXPath.new(xpath)
    end
  end
end
require 'xml_matchers/have_xpath'
