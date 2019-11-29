# Write a method no_dupes?(arr) that accepts an array as an arg and returns 
# an new array containing the elements that were not repeated in the array.
def no_dupes?(arr)
  count = Hash.new(0)
  arr.each do |char|
    count[char] += 1
  end
  count.select { |k,v| v == 1 }.keys
end

# Write a method no_consecutive_repeats?(arr) that accepts an array as an arg. 
# The method should return true if an element never appears consecutively 
# in the array; it should return false otherwise.
def no_consecutive_repeats?(arr)
  new_arr = []
  arr.each do |ele|
    if new_arr[-1] == ele
      return false
    else
      new_arr << ele
    end
  end
  true
end

# Write a method char_indices(str) that takes in a string as an arg. 
# The method should return a hash containing characters as keys. 
# The value associated with each key should be an array containing the 
# indices where that character is found.
def char_indices(str)
  count = Hash.new(0)

  str.each_char.with_index do |char, i|
    count[char.downcase] = (0..str.length - 1).find_all { |i| str[i, 1] == char }
  end
  count
end

# Write a method longest_streak(str) that accepts a string as an arg. 
# The method should return the longest streak of consecutive characters 
# in the string. If there are any ties, return the streak that occurs 
# later in the string.
def longest_streak(str)
  count = Hash.new(0)

  str.each_char do |char|
    count[char] += 1
  end

  count.map { |k, v| k * v }.inject { |a, b| a.size > b.length ? a: b }
end

# Write a method bi_prime?(num) that accepts a number as an arg and returns 
# a boolean indicating whether or not the number is a bi-prime. 
# A bi-prime is a positive integer that can be obtained by multiplying 
# two prime numbers.
def bi_prime?(num)
  nums = []

  (1..num).each do |i|
    if num % i == 0 && is_prime?(i)
      nums << i
    end
  end
  if nums.length == 1
    return nums[0] * nums[0] == num
  end

  nums.inject { |acc, i| acc * i } == num
end

# helper method
def is_prime?(num)
  return false if num < 2

  (2...num).each do |i|
    if num % i == 0
      return false
    end
  end

  true
end

# A Caesar cipher takes a word and encrypts it by offsetting each letter in 
# the word by a fixed number, called the key. Given a key of 3, 
# for example: a -> d, p -> s, and y -> b.

# A Vigenere Cipher is a Caesar cipher, but instead of a single key, 
# a sequence of keys is used. For example, if we encrypt "bananasinpajamas" 
# with the key sequence 1, 2, 3, then the result would be "ccqbpdtkqqcmbodt":

# Message:  b a n a n a s i n p a j a m a s
# Keys:     1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1
# Result:   c c q b p d t k q q c m b o d t
def vigenere_cipher(message, keys)
  new_string = ''
  alphabet = 'abcdefghijklmnopqrstuvwxyz'

  message.each_char.with_index do |char, idx|
    old_idx = alphabet.index(char)
    if keys.length == 1
      new_idx = keys[0]
    end
    new_idx = keys[idx % keys.length]
    new_pos = old_idx + new_idx
    new_string += alphabet[new_pos % 26]
  end

  new_string
end

# Write a method vowel_rotate(str) that accepts a string as an arg and returns 
# the string where every vowel is replaced with the vowel the appears before 
# it sequentially in the original string. The first vowel of the string should 
# be replaced with the last vowel.
def vowel_rotate(str)
  new_str = str[0..-1]
  vowels = 'aeiou'
  vowel_indices = (0...str.length).select { |i| vowels.include?(str[i]) }
  new_vowel_indices = vowel_indices.rotate(-1)

  vowel_indices.each_with_index do |vowel_idx, i|
    new_vowel = str[new_vowel_indices[i]]
    new_str[vowel_idx] = new_vowel
  end

  new_str
end

class String
  def select(&proc)
    proc ||= Proc.new { |e| '' }
    new_str = ''
    self.each_char do |ch|
      if proc.call(ch)
        new_str += ch
      end
    end
    new_str
  end

  def map!(&proc)
    self.each_char.with_index do |ch , i|
      self[i] = proc.call(ch, i)
    end
  end
end

def multiply(a, b)
  return 0 if a == 0 || b == 0

  if b < 0
    return - a + multiply(a, b + 1)
  else
    return a + multiply(a, b - 1)
  end
end

def lucas_sequence(n)
  return [] if n == 0
  return [2] if n == 1
  return [2, 1] if n == 2

  seq = lucas_sequence(n - 1)
  el = seq[-1] + seq[-2]
  seq << el
  seq
end

def prime_factorization(num)
  (2...num).each do |factor|
    if num % factor == 0
      other_factor = num / factor
      return prime_factorization(factor).concat(prime_factorization(other_factor))
    end
  end

  return [num]
end