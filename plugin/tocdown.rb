# find file from ARGV
file = File.open(ARGV[1], "r")

headlines = ""

def extract(line)
  line.gsub!("#", "")
end

def extract_headline?(text)
  text.start_with?("#", "##", "###", "####")
end

def get_indendation(text)
  # extract the pattern from text
  # h1 /\*{1} /
  if text =~ /\#{4}/
    "       "
  elsif text =~ /\#{3}/
    "     "
  elsif text =~ /\#{2}/
    "   "
  elsif text =~ /\#{1}/
    ""
  else
    "too nested"
  end
end

# read
while line = file.gets
  # go through each line
  if extract_headline?(line)
    # get indendation
    indent = get_indendation(line)
    # append indentation and extracted lines
    headlines << indent
    headlines << extract(line)
  end
end

File.open(ARGV[0], "w") { |f| f.puts headlines}
