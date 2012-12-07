begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "multi_progress_bar"
    gemspec.summary = "Displays multiple progress bars using Ncurses."
    gemspec.description = "Displays multiple progress bars using Ncurses.  Useful for displaying the status of multiple test runs, say, distributed across different machines.  Which is exactly why I wrote it."
    gemspec.email = "peter.a.jaros@gmail.com"
    gemspec.homepage = "http://github.com/Peeja/multi_progress_bar/tree/master/"
    gemspec.authors = ["Peter Jaros"]

    gemspec.add_dependency "ncurses"
    gemspec.add_dependency "ruby-progressbar", "0.0.9"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. For gem tasks, install it with: sudo gem install jeweler"
end


require 'rdoc/task'

desc 'Generate RDoc documentation.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.main = "README.rdoc"
  rdoc.rdoc_dir = 'doc'
  rdoc.options << '--webcvs=http://github.com/Peeja/multi_progress_bar/tree/master/'
end
