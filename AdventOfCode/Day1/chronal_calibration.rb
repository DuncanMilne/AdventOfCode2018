array = []
i = 0
total = 0
found = false
while found != true do
  File.open("chronal_calibration.txt").each() do |line|
    break if found == true
    line = line.tr('\\', '')
    char = line[0]
    line = line.tr('+', '')
    line = line.tr('-', '')
    line = line.tr('}', '')
    if char != '-'
      total = total + line.to_i
    else
      total = total - line.to_i
    end
    if array.include?(total)
      puts total
      found = true
    end
    array[i] = total
    i = i + 1
  end
end

=begin
total = 0
File.open("chronal_calibration.txt").each do |line|
    line = line.tr('\\', '')
  char = line[0]
  line = line.tr('+', '')
  line = line.tr('-', '')
  puts line
  if char == '+'
    total = total + line.to_i
  else
    total = total - line.to_i
  end
end

puts total
=end