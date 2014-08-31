require 'spec_helper'

describe RSpecXML::XMLMatchers::HaveXPath::TextMatcher do
  describe '#initialize' do
    it 'should accept an xpath' do
      matcher = subject.class.new(:xpath => 'not a real xpath')
      matcher.send(:xpath).should == 'not a real xpath'
    end

    it 'should accept text' do
      matcher = subject.class.new(:text => 'text')
      matcher.send(:text).should == 'text'
    end

  end

  describe '#matches?' do
    # TODO mock out Nokogiri
    
    it 'should return true if the supplied xml contains the xpath with supplied text' do
      matcher = subject.class.new(:xpath => '//hi', :text => 'hi')
      matcher.matches?('<hi>hi</hi>').should be_true
    end

    it 'should return false if the supplied xml contains the xpath but not the text' do
      matcher = subject.class.new(:xpath => '//hi', :text => 'what')
      matcher.matches?('<hi></hi>').should be_false
    end

    it 'should return false if the supplied xml does not contain the xpath' do
      matcher = subject.class.new(:xpath => '//hi', :text => 'what')
      matcher.matches?('<no></no>').should be_false
    end

  end

  describe '#failure_message_for_should' do
    it 'should turn a message about the xpath not existing when the supplied text' do
      subject.stubs(:xpath).returns('xpath')
      subject.stubs(:text).returns('text')
      subject.failure_message_for_should.should == "expected xpath to contain text"
    end
  end

  describe '#failure_message_for_should_not' do
    it 'should turn a message about the xpath existing when it should not' do
      subject.stubs(:xpath).returns('xpath')
      subject.stubs(:text).returns('text')
      subject.failure_message_for_should_not.should == "expected xpath to not exist with text: text"
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
