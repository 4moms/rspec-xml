module RSpecXML
  module XMLMatchers
    class HaveXPath
        
      def initialize(xpath)
        self.matcher = Matcher.new(:xpath => xpath)
      end 

      def with_text(text)
        self.matcher = TextMatcher.new(
          :xpath => matcher.xpath, 
          :text => text.to_s )
        self
      end

      def matches?(xml)
        matcher.matches?(xml)
      end

      def failure_message_for_should
        matcher.failure_message_for_should
      end

      def failure_message_for_should_not
        matcher.failure_message_for_should_not
      end

      private

      attr_accessor :matcher
    end
  end
end
