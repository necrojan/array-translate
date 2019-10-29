def high_and_low(numbers)
  return numbers.split.map(&:to_i).minmax.reverse.join(' ')
end
 
puts high_and_low("-214 542 -64 6 -6")