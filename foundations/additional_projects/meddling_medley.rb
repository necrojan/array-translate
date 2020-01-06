# Write a method duos that accepts a string as an argument and returns the count
#  of the number of times the same character appears consecutively in the 
# given string.

def duos(str)
  count = 0
  (0...str.length - 1).each do |char|
    count += 1 if str[char] == str[char + 1]
  end
  count
end

# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0

# Write a method sentence_swap that accepts a sentence and a hash as arguments. 
# The method should return a new sentence where every word is replaced with 
# it's corresponding value in the hash. If a word does not exist as a key of 
# the hash, then it should remain unchanged.

def sentence_swap(sentence, hash)
  words = sentence.split(' ')
  new_words = words.map do |word|
    new_word = word
    hash.each do |check_key, change_val|
      if check_key == word
        new_word = change_val
      end
    end
    new_word
  end
  new_words.join(' ')
end

# p sentence_swap('anything you can do I can do',
#     'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#     'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#     'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'

# Write a method hash_mapped that accepts a hash, a proc, and a block. 
# The method should return a new hash where each key is the result of the 
# original key when given to the block. Each value of the new hash should be 
# the result of the original values when passed into the proc.

def hash_mapped(hash, proc, &blck)
  new_hash = {}
  hash.each do |key, val|
    new_hash[blck.call(key)] = proc.call(val)
  end
  new_hash
end

# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# # {25=>"q", 36=>"w"}

# Write a method counted_characters that accepts a string as an argument. 
#The method should return an array containing the characters of the string 
# that appeared more than twice. The characters in the output array should 
# appear in the same order they occur in the input string.

def counted_characters(str)
  count = Hash.new(0)
  str.each_char do |char|
    count[char] += 1
  end
  count.select { |char, num| num > 2 }.keys
end

# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]

# Write a method triplet_true? that accepts a string as an argument and returns 
# a boolean indicating whether or not the string contains three of the same 
# character consecutively.

def triplet_true?(str)
  (0...str.length - 2).each do |i|
    if str[i..i+2] == str[i] * 3
      return true
    end
  end
  false
end

# p triplet_true?('caaabb')        # true
# p triplet_true?('terrrrrible')   # true
# p triplet_true?('runninggg')     # true
# p triplet_true?('bootcamp')      # false
# p triplet_true?('e')             # false

# Write a method energetic_encoding that accepts a string and a hash as 
# arguments. The method should return a new string where characters of the 
# original string are replaced with the corresponding values in the hash. 
# If a character is not a key of the hash, then it should be replaced with a 
# question mark ('?'). Space characters (' ') should remain unchanged.

def energetic_encoding(str, hash)
  new_str = ''
  (0..str.length - 1).each do |i|
    if str[i] == ' '
      new_str += ' '
    elsif hash.has_key?(str[i])
      new_str += hash[str[i]]
    else
      new_str += '?'
    end
  end
  new_str
end

# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) # 'zimp ziu'

# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) # 'ko?'

# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) # '?arri ?i?r?'

# p energetic_encoding('bike', {}) # '????'

# Write a method uncompress that accepts a string as an argument. The string 
# will be formatted so every letter is followed by a number. The method should 
# return an "uncompressed" version of the string where every letter is 
# repeated multiple times given based on the number that appears directly 
# after the letter.

def uncompress(str)
  new_str = ''
  (0...str.length - 1).each do |i|
    new_str += str[i] * str[i + 1].to_i
  end
  new_str
end

# puts uncompress('a2b4c1') # 'aabbbbc'
# puts uncompress('b1o2t1') # 'boot'
# puts uncompress('x3y1x2z4') # 'xxxyxxzzzz'

# Write a method conjunct_select that accepts an array and one or more procs as 
# arguments. The method should return a new array containing the elements that 
# return true when passed into all of the given procs.
def conjunct_select(arr, *proc)
  proc.inject(arr) { |acc, prc| acc.select(&prc) }
end

# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]