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

dates = Array.new(17)
deepDates = Array.new(17)
x = 0


lines.each do |line|
  # y/m/d/h/m/s
  dates[x] = DateTime.new(2001, line.partition("-")[2].to_i, line.split("-")[2].split(" ")[0].to_i, line.partition(":")[0][12..line.length].to_i, line.partition(":")[2][0..1].to_i)
  deepDates[x] = DateTime.new(2001, line.partition("-")[2].to_i, line.split("-")[2].split(" ")[0].to_i, line.partition(":")[0][12..line.length].to_i, line.partition(":")[2][0..1].to_i)
  x += 1
end

dates = dates.sort

newLines = Array.new(17)
i = 0
while i < dates.first(17).size
  date = dates[i]
  j = 0
  while j < deepDates.first(17).size
    deepDate = deepDates[j]
    if date == deepDate
      newLines[i] = lines[j]
    end
    j += 1
  end
  i += 1
end

timeSlept = {}

i = 0
currentGuard = -1
while i < newLines.first(17).size
  line = newLines[i]
  splittedLine = line.split(" ")
  if splittedLine[2] == "Guard"
    currentGuard = splittedLine[3]
    if timeSlept[currentGuard].nil?
      timeSlept[currentGuard] = 0
    end
  elsif splittedLine[2] == "falls"
    # Take minutes
    fellAsleepAt = line.partition(":")[2][0..1].to_i
  elsif splittedLine[2] == "wakes"
    timeAsleep = line.partition(":")[2][0..1].to_i - fellAsleepAt.to_i
    timeSlept[currentGuard] = timeSlept[currentGuard] + timeAsleep
  end
  i += 1
end


puts timeSlept.max_by{|k,v| v}