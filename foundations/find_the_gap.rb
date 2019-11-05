# frozen_string_literal: true

def find_the_gap(chars)
  alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
  missing = 0
  last = chars[-1]

  alphabet.each_char do |i|
    missing += 1 unless chars.include?(i)
    break if alphabet[i] == last
  end

  missing
end

puts find_the_gap('ABC') # 0
puts find_the_gap('ABD') # 1
puts find_the_gap('BCF') # 3
puts find_the_gap('BCDFGHJKLMNPQRSTVWXZ') # 6
