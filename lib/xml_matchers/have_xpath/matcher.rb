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
    end
  end
end
