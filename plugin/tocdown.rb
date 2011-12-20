path = ARGV[0]

File.open(path, "w") { |f| f.puts Time.now}
