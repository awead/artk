desc "Create the test rails app"
task :generate do
  unless File.exists?("spec/dummy")
    puts "Generating test app"
    system "rails new spec/dummy"
    `echo "gem 'artk', :path=>'../../../artk'" >> spec/dummy/Gemfile`
    `echo "gem 'rspec-rails'" >> spec/dummy/Gemfile`
    `echo "gem 'mysql2'" >> spec/dummy/Gemfile`
    puts "Copying generator"
    `cp -r spec/support/lib/generators spec/dummy/lib`
    Bundler.with_clean_env do
      within_test_app do
        puts "running test_app_generator"
        system "rails generate test_app"
        puts "Bundle install"
        system "bundle install"
      end
    end
  end
  puts "Done generating test app"
end

desc "Delete test app and generate a new one"
task :regenerate do
  puts "Deleting test app"
  system "rm -Rf spec/dummy"
  Rake::Task["generate"].invoke
end

desc "Do a full run of tests"
task :spec do
  Rake::Task["generate"].invoke
  Rake::Task["generate"].reenable
  Bundler.with_clean_env do
    within_test_app do
      Rake::Task['rspec'].invoke
    end
  end
end

desc "Run rspec tests in the spec directory"
RSpec::Core::RakeTask.new(:rspec) do |t|
  t.pattern = '../**/*_spec.rb'
  t.rspec_opts = "--colour -I ../"
end

desc "Start the test rails app"
task :start do
  Bundler.with_clean_env do
    within_test_app do
      puts "Starting test app"
      system "rails server -d"
    end
  end
end

desc "Stop the test rails app"
task :stop do
  pid_file = "tmp/pids/server.pid"
  within_test_app do
    if File.exists?(pid_file)
      pid = File.read(pid_file)
      puts "Stopping pid #{pid}"
      system "kill -2 #{pid}"
    end
  end
end

def within_test_app
  return unless File.exists?("spec/dummy")
  FileUtils.cd("spec/dummy")
  yield
  FileUtils.cd("../..")
end