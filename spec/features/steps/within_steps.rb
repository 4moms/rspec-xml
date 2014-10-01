steps_for :within do
  step 'there is a string of XML' do
    @xml = lambda { |insides| "<xml><elem>#{insides}</elem></xml>" }
  end

  step 'there are the following nodes:' do |table|
    text = table.hashes.map { |h| "<#{h["node"]}>#{h["value"]}</#{h["node"]}>" }
    @xml = @xml[text.join]
  end

  step 'I test for the following text within the corresponding nodes:' do |table|
    @test = lambda do
      within('xml') do
        within('/elem') do
          table.hashes.each do |hash|
            expect(@xml).to have_xpath("/#{hash["node"]}").with_text(hash["text"])
          end
        end
      end
    end
  end

  step 'the test should pass' do
    expect(@test).not_to raise_error
  end

  step 'the test should fail' do
    expect(@test).to raise_error(RSpec::Expectations::ExpectationNotMetError)
  end
end

