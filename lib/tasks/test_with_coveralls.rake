require 'coveralls/rake/task'
Coveralls::RakeTask.new

desc "Test with coveralls"
task :test_with_coveralls => [:test, 'coveralls:push']
