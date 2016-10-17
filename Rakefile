require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'cucumber/rake/task'

RSpec::Core::RakeTask.new(:spec)

Cucumber::Rake::Task.new do |t|
  t.cucumber_opts = '--format pretty'
end

task :rubocop do
  sh 'bundle exec rubocop'
end

desc 'Run tests, both RSpec and Cucumber'
task test: [:rubocop, :spec, :cucumber]

task default: :test
