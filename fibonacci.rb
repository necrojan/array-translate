# frozen_string_literal: true

def fibonacci(length)
  arr = []

  return arr if length == 0

  return arr << length if length == 1

  arr = [1, 1]
  while arr.length < length
    last = arr[-1]
    second_last = arr[-2]
    ele = last + second_last
    arr << ele
  end
  arr
  end

print fibonacci(0) # => []
puts
print fibonacci(1) # => [1]
puts
print fibonacci(6) # => [1, 1, 2, 3, 5, 8]
puts
print fibonacci(8) # => [1, 1, 2, 3, 5, 8, 13, 21]
puts
