require 'spec_helper'

describe RSpecXML::XMLMatchers::HaveXPath::TextMatcher do
  describe '#initialize' do
    it 'should accept an xpath' do
      matcher = subject.class.new(:xpath => 'not a real xpath')
      expect(matcher.send(:xpath)).to eq 'not a real xpath'
    end

    it 'should accept text' do
      matcher = subject.class.new(:text => 'text')
      expect(matcher.send(:text)).to eq 'text'
    end

  end

  describe '#matches?' do
    # TODO mock out Nokogiri

    it 'should return true if the supplied xml contains the xpath with supplied text' do
      matcher = subject.class.new(:xpath => '//hi', :text => 'hi')
      expect(matcher.matches?('<hi>hi</hi>')).to be_truthy
    end

    it 'should return false if the supplied xml contains the xpath but not the text' do
      matcher = subject.class.new(:xpath => '//hi', :text => 'what')
      expect(matcher.matches?('<hi></hi>')).to be_falsey
    end

    it 'should return false if the supplied xml does not contain the xpath' do
      matcher = subject.class.new(:xpath => '//hi', :text => 'what')
      expect(matcher.matches?('<no></no>')).to be_falsey
    end

  end

  describe '#failure_message' do
    it 'should turn a message about the xpath not existing when the supplied text' do
      subject.stubs(:xpath).returns('xpath')
      subject.stubs(:text).returns('text')
      expect(subject.failure_message).to eq "expected xpath to contain text"
    end
  end

  describe '#failure_message_when_negated' do
    it 'should turn a message about the xpath existing when it should not' do
      subject.stubs(:xpath).returns('xpath')
      subject.stubs(:text).returns('text')
      expect(subject.failure_message_when_negated).to eq "expected xpath to not exist with text: text"
    end
  end

  describe '#description' do
    it 'should return a message describing the text matcher' do
      subject.stubs(:xpath).returns('/expr')
      subject.stubs(:text).returns('text')
      subject.description.should == 'have xpath /expr with text text'
    end
  end
end
