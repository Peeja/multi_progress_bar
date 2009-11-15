#!/usr/local/bin/ruby -w

# Not actually an example, but a script to run the example every
# time a file changes, for testing.
# 
#   example/loop example/example.rb

command = ARGV.shift
file_patterns_to_watch = (ARGV.length > 0 ? ARGV : ['**/*.rb'])

files = {}

file_patterns_to_watch.each do |arg|
  Dir[arg].each { |file|
    files[file] = File.mtime(file)
  }
end

trap('INT') do
  puts "\nQuitting..."
  exit
end


loop do
  system command

  loop do
    sleep 0.1

    changed_file, last_changed = files.find { |file, last_changed|
      File.mtime(file) > last_changed
    }

    if changed_file
      files[changed_file] = File.mtime(changed_file)
      break
    end
  end
end
