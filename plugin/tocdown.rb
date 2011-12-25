headings = IO.readlines(ARGV[1]).collect do |line|
  line.match(/^[#]{1,4}/) ? ("  " * ($&.length - 1) + $'.strip) : nil
end

headings.compact!.delete_if { |line| line.match /\s*#/ }

File.open(ARGV[0], 'w') { |file| file.write(headings.join ("\n")) }
