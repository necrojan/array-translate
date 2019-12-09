
# Write a method strange_sums that accepts an array of numbers as an argument. 
# The method should return a count of the number of distinct pairs of 
# elements that have a sum of zero. You may assume that the input 
# array contains unique elements.
def strange_sums(arr)
  count = 0

  return 0 if arr.length == 1

  arr.each_with_index do |ele_1, idx1|
    arr.each_with_index do |ele_2, idx2|
      if idx2 > idx1
        count += 1 if ele_1 + ele_2 == 0
      end
    end
  end
  count
end

# Write a method pair_product that accepts an array of numbers and a 
# product as arguments. The method should return a boolean indicating 
# whether or not a pair of distinct elements in the array result in 
# the product when multiplied together. You may assume that the input 
# array contains unique elements.
def pair_product(numbers, product)
  numbers.each_with_index do |ele_1, idx1|
    numbers.each_with_index do |ele_2, idx2|
      if idx2 > idx1
        return true if ele_1 * ele_2 == product
      end
    end
  end
  false
end

# Write a method rampant_repeats that accepts a string and a hash as arguments. 
# The method should return a new string where characters of 
# the original string are repeated the number of times specified by the hash. 
# If a character does not exist as a key of the hash, then it should remain 
# unchanged.
def rampant_repeats(string, hash)
  new_string = ''
  string.each_char do |char|
    if hash.key?(char)
      new_string += char * hash[char]
    else
      new_string += char
    end
  end
  new_string
end

# Write a method perfect_square? that accepts a number as an argument. 
# The method should return a boolean indicating whether or 
# not the argument is a perfect square. A perfect square is a 
# number that is the product of some number multiplied by itself. 
# For example, since 64 = 8 * 8 and 144 = 12 * 12, 64 and 144 are 
# perfect squares; 35 is not a perfect square.
def perfect_square(num)
  (1..num).each do |factor|
    return true if factor * factor == num
  end
  false
end

# helper method
def num_factors(num)
  (1..num).count { |i| num % i == 0 }
end

# Write a method anti_prime? that accepts a number as an argument. 
# The method should return true if the given number has more 
# divisors than all positive numbers less than the given number. 
# For example, 24 is an anti-prime because it has more divisors than 
# any positive number less than 24. Math Fact: 
# Numbers that meet this criteria are also known as highly composite numbers.
def anti_prime?(num)
  nums = num_factors(num)
  (1...num).all? { |i| nums > num_factors(i) }
end

# Let a 2-dimensional array be known as a "matrix". Write a method 
# matrix_addition that accepts two matrices as arguments. The two matrices are 
# guaranteed to have the same "height" and "width". 
# The method should return a new matrix representing the sum of the two 
# arguments. To add matrices, we simply add the values at the same positions:
def matrix_addition(matrx_1, matrx_2)
  height = matrx_1.length
  width = matrx_1[0].length

  result = Array.new(height) { [0] * height }

  (0...height).each do |row|
    (0...width).each do |col|
      result[row][col] = matrx_1[row][col] + matrx_2[row][col]
    end
  end

  result
end

# Write a method mutual_factors that accepts any amount of numbers as arguments.
# The method should return an array containing all of the common divisors 
# shared among the arguments. For example, the common divisors of 50 and 30 
# are 1, 2, 5, 10. You can assume that all of the arguments are positive integers.
def mutual_factors(*args)
  args.map { |n| factors(n) }.inject(:&) 
end

def factors(num)
  (1..num).select { |i| num % i == 0}
end

# The tribonacci sequence is similar to that of Fibonacci. 
# The first three numbers of the tribonacci sequence are 1, 1, and 2. 
# To generate the next number of the sequence, we take the sum of the 
# previous three numbers. The first six numbers of tribonacci sequence are:
def tribonacci_number(n)
  sequence = [1, 1, 2, 4]

  while sequence.length <= n
    sequence << sequence[-3] + sequence[-2] + sequence[-1]
  end

  sequence[n - 1]
end

# Write a method matrix_addition_reloaded that accepts any number of 
# matrices as arguments. The method should return a new matrix 
# representing the sum of the arguments. Matrix addition can only be
# performed on matrices of similar dimensions, so if all of the 
# given matrices do not have the same "height" and "width", then return nil.
def matrix_addition_reloaded(*m)
  matrix = m.first
  height = matrix.length
  width = matrix[0].length

  new_matrix = Array.new(height) { [0] * width }
  
  m.inject(new_matrix) do |m1, m2|
    matrix_addition(m1, m2)
  end
end

# Write a method squarocol? that accepts a 2-dimensional array as an argument. 
# The method should return a boolean indicating whether or not any row or 
# column is completely filled with the same element. You may assume that 
# the 2-dimensional array has "square" dimensions, meaning it's height 
# is the same as it's width.
def squarocol?(arr)
  return true if arr.any? { |x| x.uniq.count == 1}
  return true if arr.transpose.any? { |x| x.uniq.count == 1 }
  false
end

# Write a method squaragonal? that accepts 2-dimensional array as an argument. 
# The method should return a boolean indicating whether or not the array 
# contains all of the same element across either of its diagonals. 
# You may assume that the 2-dimensional array has "square" dimensions, 
# meaning it's height is the same as it's width.
def squaragonal?(arr)
  return true if (0...arr.length).collect { |row| arr[row][row] }.uniq.size <= 1
  
  len = arr.length
  return true if (0...arr.length).collect { |row| arr[row][len -= 1] }.uniq.size <= 1
  
  false
end

def adjacent_sum(arr)
  sum = []
  (0...arr.length - 1).each do |i|
    sum << arr[i] + arr[i + 1]
  end
  sum
end

# Pascal's triangle is a 2-dimensional array with the shape of a pyramid. 
# The top of the pyramid is the number 1. To generate further levels of the 
# pyramid, every element is the sum of the element above and to the left with 
# the element above and to the right. Nonexisting elements are treated as 0 
# when calculating the sum. For example, here are the first 5 levels of 
# Pascal's triangle:

def pascals_triangle(num)
  arr = []
  (1..num).each do |i|
    arr << (1..i).map { |v| v == 1 ? 1 : (arr.last[v - 2] + arr.last[v - 1] rescue 1) }
  end
  arr
end
