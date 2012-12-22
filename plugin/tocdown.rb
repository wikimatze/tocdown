headings = IO.readlines(ARGV[0]).collect do |line|
  line.match(/^[#]{1,4}/) ? ("  " * ($&.length - 1) + $'.strip) : nil
end

headings.compact!
headings.map { |line| line.gsub!(/\s*#\s*/, '') }

File.open(ARGV[1], "w") { |file| file.write(headings.join ("\n")) }
