require 'spec_helper'

describe RSpecXML::XMLMatchers::HaveXPath::AttrMatcher do
  describe '#initialize' do
    it 'should accept an xpath' do
      matcher = subject.class.new(:xpath => 'not a real xpath')
      expect(matcher.send(:xpath)).to eq 'not a real xpath'
    end

    it 'should accept attr' do
      matcher = subject.class.new(:attr => {'foo' => 'bar', 'x' => 2})
      expect(matcher.send(:attr)).to eq({'foo' => 'bar', 'x' => 2})
    end

  end

  describe '#matches?' do
    # TODO mock out Nokogiri

    it 'should return true if the supplied xml contains the xpath with supplied attributes' do
      matcher = subject.class.new(:xpath => '//hi', :attr => {'foo' => 'bar', 'x' => 2})
      expect(matcher.matches?('<hi foo="bar" x="2"/>')).to be_truthy
    end

    it 'should return false if the supplied xml contains the xpath but not the one of the attibutes' do
      matcher = subject.class.new(:xpath => '//hi', :attr => {'foo' => 'bar', 'x' => 2, 'y' => 3})
      expect(matcher.matches?('<hi foo="bar" x="2"/>')).to be_falsey
    end

    it 'should return false if the supplied xml contains the xpath but one of the attibutes has a wrong value' do
      matcher = subject.class.new(:xpath => '//hi', :attr => {'foo' => 'bar', 'x' => 3})
      expect(matcher.matches?('<hi foo="bar" x="2"/>')).to be_falsey
    end

    it 'should return false if the supplied xml does not contain the xpath' do
      matcher = subject.class.new(:xpath => '//hi', :attr => {'foo' => 'bar', 'x' => 2})
      expect(matcher.matches?('<no></no>')).to be_falsey
    end

  end

  describe '#failure_message' do
    it 'should turn a message about the xpath not existing when the supplied text' do
      subject.stubs(:xpath).returns('xpath')
      subject.stubs(:attr).returns({'foo' => 'bar', 'x' => 2})
      expect(subject.failure_message).to eq "expected xpath to contain attribute: {\"foo\"=>\"bar\", \"x\"=>2}"
    end
  end

  describe '#failure_message_when_negated' do
    it 'should turn a message about the xpath existing when it should not' do
      subject.stubs(:xpath).returns('xpath')
      subject.stubs(:attr).returns({'foo' => 'bar', 'x' => 2})
      expect(subject.failure_message_when_negated).to eq "expected xpath to not exist with attribute: {\"foo\"=>\"bar\", \"x\"=>2}"
    end
  end

  describe '#description' do
    it 'should return a message describing the text matcher' do
      subject.stubs(:xpath).returns('/expr')
      subject.stubs(:attr).returns({'foo' => 'bar', 'x' => 2})
      expect(subject.description).to eq "have xpath /expr with attribute: {\"foo\"=>\"bar\", \"x\"=>2}"
    end
  end
end
