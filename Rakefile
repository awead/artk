begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

Bundler::GemHelper.install_tasks

Dir.glob('tasks/*.rake').each { |r| import r }

ENV["RAILS_ROOT"] ||= 'spec/internal'

require 'rspec/core/rake_task'

task :default => [:spec]