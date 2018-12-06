lines = File.readlines("no_matter_how_you_slice_it_part1.txt")

grid = Array.new(1000) { Array.new(1000) {0} }

lines.each do |line|
  splitLine = line.partition('@ ').last
  cellsFromLeft = splitLine.partition(',')[0].to_i
  cellsFromRight = splitLine.partition(',')[2].partition(':').first.to_i
  inchesWide = splitLine.partition('x')[0].partition(': ').last.to_i
  inchesTall = splitLine.partition('x')[2].to_i

  i = cellsFromLeft
  while i < cellsFromLeft + inchesWide
    j = cellsFromRight
    while j < cellsFromRight + inchesTall
      grid[i][j] += 1
      j += 1
    end
    i += 1
  end
end

lines.each do |line|
  notOverlapping = true
  splitLine = line.partition('@ ').last
  cellsFromLeft = splitLine.partition(',')[0].to_i
  cellsFromRight = splitLine.partition(',')[2].partition(':').first.to_i
  inchesWide = splitLine.partition('x')[0].partition(': ').last.to_i
  inchesTall = splitLine.partition('x')[2].to_i

  i = cellsFromLeft
  while i < cellsFromLeft + inchesWide
    j = cellsFromRight
    while j < cellsFromRight + inchesTall
      if grid[i][j] != 1
        notOverlapping = false
      end
      j += 1
    end
    i += 1
  end
  if notOverlapping
    puts line.partition(" ")[0]
  end
end