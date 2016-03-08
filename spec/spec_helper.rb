require 'reek/spec'
RSpec.configure do |config|
  config.mock_with :rspec

  config.include(Reek::Spec)
  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  config.order = 'random'

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
end
