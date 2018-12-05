array = File.readlines("InventoryManagementSystem.txt")

i = 0

twoOccurencesCount = 0
threeOccurencesCount = 0

while i < array.length

  currentWord = array[i]
  chars = currentWord.split('')

  charCount = Array.new(26) {
    0
  }

  puts charCount
  x = 0
  # 10 is unicode for space, causes error if we try to access index 10 - 97
  puts chars.length
  while x < chars.length and not chars[x].ord == 10
    charCount[(chars[x].ord) -97] += 1
    puts charCount[(chars[x].ord) -97]
    x += 1
  end

  if charCount.include? 2
    twoOccurencesCount += 1
  end
  if charCount.include? 3
    threeOccurencesCount += 1
  end

  i += 1
end

puts twoOccurencesCount * threeOccurencesCount