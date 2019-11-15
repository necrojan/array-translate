# frozen_string_literal: true

# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
def largest_prime_factor(num)
  primes = []
  (1..num).each do |n|
    primes << n if num % n == 0 && is_prime?(n)
  end
  primes.max
end

def is_prime?(num)
  return false if num < 2

  (2...num).each do |factor|
    return false if num % factor == 0
  end
  true
end

def unique_chars?(str)
  count = Hash.new(0)

  str.each_char do |char|
    count[char] += 1
  end
  count.none? { |_k, v| v > 1 }
end

def dupe_indices(arr)
  arr.each_with_index.reduce({}) do |h, (char, i)|
    h[char] = (h[char] || []) << i
    h
  end.select { |k, v| v.size > 1}
end

def ana_array(arr_1, arr_2)
  (arr_2 - arr_1).empty? && (arr_1 - arr_2).empty?
end