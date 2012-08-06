module XMLMatchers
  class HaveXPath
      
    def initialize(xpath)
      @xpath = xpath 
    end 

    def with_text(text)
      @text = text
      self
    end

    def matches?(xml)
      ::Nokogiri::XML(xml).xpath(@xpath).text == @text
    end

    def failure_message_for_should
      "expected #{@xpath} to exist" 
    end

    def failure_message_for_should_not
      "expected #{@xpath} to not exist" 
    end
  end

  def have_xpath(xpath)
    HaveXPath.new(xpath)
  end
end

