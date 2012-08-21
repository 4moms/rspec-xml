module RSpecXML
  module XMLMatchers
    class HaveXPath
        
      private

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
  end
end
