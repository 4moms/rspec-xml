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
          node = ::Nokogiri::XML(xml).xpath(xpath)
          !node.empty? && attr.all? do |k, v|
            attr_value = node.attr(k.to_s)
            !attr_value.nil? && attr_value.value == v.to_s
          end
        end

        def description
          "have xpath #{xpath} with attribute: #{attr}"
        end

        def failure_message
          "expected #{xpath} to contain attribute: #{attr}"
        end

        def failure_message_when_negated
          "expected #{xpath} to not exist with attribute: #{attr}"
        end

        private

        attr_accessor :attr, :xpath
      end
    end
  end
end
