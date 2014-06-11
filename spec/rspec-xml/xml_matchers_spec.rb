require 'spec_helper'

describe RSpecXML::XMLMatchers do
  describe '#within' do

    it 'should create instance variable @xpath_stack inside within block' do
      expect(@xpath_stack).to be_nil
      within("foo/bar") do
        expect(@xpath_stack).to eq ["foo/bar"]
      end
    end

    it 'should increase @xpath_stack properly when blocks are nested' do
      within("foo") do
        within("/bar") do
          expect(@xpath_stack).to eq ["foo", "/bar"]
        end
      end
    end

    it 'should reduce @xpath_stack on exit from block' do
      within("foo") do
        within("/bar") do
        end
        expect(@xpath_stack).to eq ["foo"]
      end
      expect(@xpath_stack).to eq []
    end

  end
end

