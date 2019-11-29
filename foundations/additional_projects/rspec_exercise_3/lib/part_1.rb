def is_prime?(num)
  return false if num < 2

  (2...num).each do |factor|
    if num % factor == 0
      return false
    end
  end

  true
end

def nth_prime(n)
  arr = []
  i = 1

  while arr.length < n
    i += 1
    arr << i if is_prime?(i)
  end
  i
end

def prime_range(min, max)
  primes = []

  (min..max).each do |i|
    if is_prime?(i)
      primes << i
    end
  end
  primes
end

def element_count(arr)
  count = Hash.new(0)
  arr.each { |i| count[i] += 1 }
  count
end

def char_replace!(str, hash)
  (0...str.length).each do |i|
    if hash.has_key?(str[i])
      str[i] = hash[str[i]]
    end
  end
  str
end

def product_inject(numbers)
  numbers.inject(1) { |acc, e| acc * e }
end
