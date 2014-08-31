steps_for :have_path do
  step 'there is a string of XML' do
    @xml = lambda { |insides| "<xml>#{insides}</xml>" }
  end

  step 'the :node_name node contains the text: :text' do |node_name, text|
    @xml = @xml.call "<#{node_name}>#{text}</#{node_name}>"
  end

  step 'I test for the text: :text within the :node_name node' do |text, node_name|
    @test = lambda { @xml.should have_xpath("//#{node_name}").with_text(text) }
  end

  step 'the test should pass' do
    @test.should_not raise_error
  end

  step 'the test should fail' do
    @test.should raise_error(RSpec::Expectations::ExpectationNotMetError)
  end

end
