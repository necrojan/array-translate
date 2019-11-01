# frozen_string_literal: true

def anagrams?(word1, word2)
  count_char(word1) == count_char(word2)
end

def count_char(word)
  count = Hash.new(0)
  word.each_char { |char| count[char] += 1 }
  count
end

puts count_char('cat') == count_char('act')
puts '--'
puts anagrams?('cat', 'act')          #=> true
puts anagrams?('restful', 'fluster')  #=> true
puts anagrams?('cat', 'dog')          #=> false
puts anagrams?('boot', 'bootcamp')    #=> false
