root =  File.dirname(__FILE__)
require "#{root}/xml_matchers/have_xpath/matcher"
require "#{root}/xml_matchers/have_xpath/text_matcher"
require "#{root}/xml_matchers/have_xpath"

module RSpecXML
  module XMLMatchers

    def have_xpath(xpath)
      HaveXPath.new(xpath, self)
    end

    def within(xpath, &example_group_block)
      return unless block_given?

      instance_exec(example_group_block) do
        @xpath_stack ||= [] 
        @xpath_stack.push xpath
        yield
        @xpath_stack.pop
      end
    end

  end
end
