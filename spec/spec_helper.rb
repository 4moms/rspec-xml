require File.expand_path('../../lib/rspec-xml', __FILE__)

Dir.glob('spec/features/steps/**/*.rb') { |f| require File.expand_path(f) }

RSpec.configure do |config|
  config.mock_with :mocha
end
