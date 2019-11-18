# frozen_string_literal: true

# Write a method that takes a string as an argument and groups the number
# of time each character appears in the string as a hash sorted by the highest
# number of occurrences.

def get_char_count(string)
  alphabet = 'abcdefghijklmnopqrstuvwxyz1234567890'
  count = Hash.new(0)
  valid_keys = []

  string.each_char.with_index do |char, _i|
    count[char.downcase] += 1
  end

  count.keys.each do |char|
    valid_keys << char if alphabet.include?(char)
  end
  valid_keys.sort.group_by { |k| count[k] }.sort_by { |k, _v| k }.reverse.to_h
end

p get_char_count('Mississippi') # => {4=>["i", "s"], 2=>["p"], 1=>["m"]}
p get_char_count('Hello. Hello? HELLO!') # => {6=>["l"], 3=>["e", "h", "o"]}
p get_char_count('abc123') # => {1=>["1", "2", "3", "a", "b", "c"]}
