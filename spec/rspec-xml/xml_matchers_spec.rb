require 'spec_helper'

describe RSpecXML::XMLMatchers do
  describe '#within' do

    it 'should create instance variable @xpath_stack inside within block' do
      @xpath_stack.should be_nil
      within("foo/bar") do
        @xpath_stack.should == ["foo/bar"]
      end
    end

    it 'should increase @xpath_stack properly when blocks are nested' do
      within("foo") do
        within("/bar") do
          @xpath_stack.should == ["foo", "/bar"]
        end
      end
    end

    it 'should reduce @xpath_stack on exit from block' do
      within("foo") do
        within("/bar") do
        end
        @xpath_stack.should == ["foo"]
      end
      @xpath_stack.should == []
    end

  end
end

