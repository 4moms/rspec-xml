require 'spec_helper'

describe RSpecXML::XMLMatchers::HaveXPath::Matcher do
  describe '#initialize' do
    it 'should accept an xpath' do
      matcher = subject.class.new(:xpath => 'not a real xpath')
      expect(matcher.xpath).to eq 'not a real xpath'
    end
  end

  describe '#matches?' do
    # TODO mock out Nokogiri

    it 'should return true if the supplied xml contains the xpath' do
      matcher = subject.class.new(:xpath => '//hi')
      expect(matcher.matches?('<hi></hi>')).to be_truthy
    end

    it 'should return false if the supplied xml contains the xpath' do
      matcher = subject.class.new(:xpath => '//hi')
      expect(matcher.matches?('<no></no>')).to be_falsey
    end
  end

  describe '#failure_message_for_should' do
    it 'should turn a message about the xpath not existing when it should' do
      subject.stubs(:xpath).returns('xpath')
      expect(subject.failure_message).to eq "expected xpath to exist"
    end
  end

  describe '#failure_message_for_should_not' do
    it 'should turn a message about the xpath existing when it should not' do
      subject.stubs(:xpath).returns('xpath')
      expect(subject.failure_message_when_negated).to eq "expected xpath to not exist"
    end
  end

  describe '#description' do
    it 'should return a message describing the xpath matcher' do
      subject.stubs(:xpath).returns('/expr')
      subject.description.should == 'have xpath /expr'
    end
  end
end
