# Sort into chronological order
#   1. extract dates from lines - done
#   2. dateParse then deepcopy - done
#   3. sort by dates - done
#   4. compare old array to sorted array, create new array of lines and put line 1 in where line 1 of old array is in sorted array - done
#     a) this is so we can see what happened at that time - done
# Find guard who has most minutes asleep
# parse lines, have a current guard that switches when someone starts shift
require 'date'
lines = File.readlines("ReposeRecord.txt")

dates = Array.new(934)
deepDates = Array.new(934)
x = 0


lines.each do |line|
  # y/m/d/h/m/s
  dates[x] = DateTime.new(2001, line.partition("-")[2].to_i, line.split("-")[2].split(" ")[0].to_i, line.partition(":")[0][12..line.length].to_i, line.partition(":")[2][0..1].to_i)
  deepDates[x] = DateTime.new(2001, line.partition("-")[2].to_i, line.split("-")[2].split(" ")[0].to_i, line.partition(":")[0][12..line.length].to_i, line.partition(":")[2][0..1].to_i)
  x += 1
end

dates = dates.sort

newLines = Array.new(934)
i = 0
while i < dates.size
  date = dates[i]
  j = 0
  while j < deepDates.size
    deepDate = deepDates[j]
    if date == deepDate
      newLines[i] = lines[j]
    end
    j += 1
  end
  i += 1
end

puts newLines
timeAsleep = {}

i = 0
while i < lines.size
  currentGuard = -1
  line = lines[i]
  splittedLine = line.split(" ")
  if splittedLine[2] == "Guard"
    currentGuard = splittedLine[3]
    puts currentGuard
  elsif splittedLine[2] == "falls"
    
  end
  i += 1
end