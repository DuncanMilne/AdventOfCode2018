lines = File.readlines("no_matter_how_you_slice_it_part1.txt")

grid = { }

lines.each do |line|
  puts /$@/.match(line)
end

puts grid

