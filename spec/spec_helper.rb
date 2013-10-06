require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require 'rspec/rails'

ENV["RAILS_ENV"] ||= 'test'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end