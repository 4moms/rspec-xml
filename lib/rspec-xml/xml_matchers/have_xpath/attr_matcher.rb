module RSpecXML
  module XMLMatchers
    class HaveXPath

      private

      class AttrMatcher

        def initialize(options={})
          self.xpath = options[:xpath]
          self.attr = options[:attr]
        end

        def matches?(xml)
          attr.each do |k, v|
            ::Nokogiri::XML(xml).xpath(xpath).attr(k.to_s).value == v.to_s
          end
        end

        def failure_message_for_should
          "expected #{xpath} to contain #{attr}"
        end

        def failure_message_for_should_not
          "expected #{xpath} to not exist with attribute: #{attr}"
        end

        private

        attr_accessor :attr, :xpath
      end
    end
  end
end
