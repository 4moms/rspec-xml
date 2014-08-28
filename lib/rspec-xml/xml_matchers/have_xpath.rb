module RSpecXML
  module XMLMatchers
    class HaveXPath
      def initialize(xpath, example_group)
        self.matcher = Matcher.new(
          :xpath => xpath,
          :example_group => example_group
        )
      end

      def with_text(text)
        self.matcher = TextMatcher.new(
          :xpath => matcher.full_xpath,
          :text => text.to_s
        )

        self
      end

      def with_attr(attr)
        self.matcher = AttrMatcher.new(
          :xpath => matcher.full_xpath,
          :attr => attr
        )

        self
      end

      def matches?(xml)
        matcher.matches?(xml)
      end

      def failure_message
        matcher.failure_message
      end

      def failure_message_when_negated
        matcher.failure_message_when_negated
      end

      private

      attr_accessor :matcher
    end
  end
end
