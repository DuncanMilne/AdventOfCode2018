lines = File.readlines("part_two.txt")

firstStringIterator = 0
secondStringIterator = 1

while firstStringIterator < lines.length
  firstString = lines[firstStringIterator].strip().split('')
  while secondStringIterator < lines.length
    secondString = lines[secondStringIterator].strip().split('')
    diffChars = 0
    x = 0
    while x < firstString.length and x < secondString.length
      if not firstString[x] == secondString[x]
        diffChars += 1
      end
      x += 1
    end
    if diffChars < 2
      puts firstString.join("")
      puts secondString.join("")
    end
    secondStringIterator += 1
  end
  firstStringIterator += 1
  secondStringIterator = firstStringIterator + 1
end

