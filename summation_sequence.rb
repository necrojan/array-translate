# frozen_string_literal: true

def summation_sequence(start, length)
  arr = [start]
  count = 0

  while arr.length < length
    (1..arr[-1]).each do |num|
      count += num
    end
    arr << count
    count = 0
  end

  arr
  end

print summation_sequence(3, 4) # => [3, 6, 21, 231]
print summation_sequence(5, 3) # => [5, 15, 120]
