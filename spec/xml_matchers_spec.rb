require 'spec_helper'

describe RSpecXML::XMLMatchers do
  describe '#have_xpath' do
		context '#with_text' do
			it 'should pass if the xpath exists containing the supplied text' do
				"<node>HAI</node>".should have_xpath('/node').with_text('HAI')
			end

      it 'should handle numbers' do
        "<node>3</node>".should have_xpath('/node').with_text(3)
      end

			it "should fail if the xpath does not exist" do
				lambda { "<node>HAI</node>".should have_xpath('/ne').with_text('HAI')}.
					should raise_error(RSpec::Expectations::ExpectationNotMetError)
			end

			it 'should fail if the xpath does not contain the supplied text' do
				lambda { "<node>HAI</node>".should have_xpath('/ne').with_text('HI')}.
					should raise_error(RSpec::Expectations::ExpectationNotMetError)
			end
		end

		context 'without specifying text' do
			it 'should pass if the node exists' do
				'<node>something</node>'.should have_xpath('/node')
			end

			it 'should fail if the node does not exist' do
				lambda { "<node>HAI</node>".should have_xpath('/ne')}.
					should raise_error(RSpec::Expectations::ExpectationNotMetError)
			end
		end
  end
end
