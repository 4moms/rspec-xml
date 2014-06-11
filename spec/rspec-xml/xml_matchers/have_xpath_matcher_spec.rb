require 'spec_helper'

module Factory
  def self.example_group
    @example_group ||= Class.new
  end
  def self.xpath_matcher(xpath)
    RSpecXML::XMLMatchers::HaveXPath.new(xpath, example_group)
  end
end

describe RSpecXML::XMLMatchers::HaveXPath do
  let(:example_group) { Factory.example_group }

  describe '#intialize' do
    it 'should build and save a matcher containing the supplied xpath' do

      RSpecXML::XMLMatchers::HaveXPath::Matcher.
        expects(:new).
        with(:xpath => 'fake xpath', :example_group => example_group).
        returns(:flag)

      xpath_matcher = Factory.xpath_matcher('fake xpath')
      expect(xpath_matcher.send(:matcher)).to eq :flag

    end
  end

  describe '#with_text' do
    it 'should build a new text matcher containing supplied xpath and text' do

      RSpecXML::XMLMatchers::HaveXPath::TextMatcher.
        expects(:new).
        with(:xpath => 'fake xpath', :text => 'blah').
        returns(:flag)

      xpath_matcher = Factory.xpath_matcher('fake xpath').with_text('blah')
      expect(xpath_matcher.send(:matcher)).to eq :flag

    end
  end

  describe '#failure_message' do
    it 'should delegate to the matcher' do
      xpath_matcher = Factory.xpath_matcher('whatever')
      xpath_matcher.stubs(:matcher).returns(stub( :failure_message => 'woo!' ))

      expect(xpath_matcher.failure_message).to eq 'woo!'
    end
  end

  describe '#failure_message_when_negated' do
    it 'should delegate to the matcher' do
      xpath_matcher = Factory.xpath_matcher('whatever')
      xpath_matcher.stubs(:matcher).returns(stub( :failure_message_when_negated => 'woo!' ))

      expect(xpath_matcher.failure_message_when_negated).to eq 'woo!'
    end
  end
end
