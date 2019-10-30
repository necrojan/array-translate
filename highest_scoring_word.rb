# frozen_string_literal: true

def high(x)
  alphabet = 'abcdefghijklmnopqrstuvwxyz'
  words = x.split(' ')
  count = 0
  scores = {}

  words.each_with_index do |item, _idx|
    item.each_char.with_index do |char, _id|
      pos = alphabet.index(char)
      count += pos + 1
    end
    scores[item] = count
    count = 0
  end
  scores.max_by { |_k, v| v }[0]
end

puts high('man i need a taxi up to ubud taxi') # taxi
puts high('what time are we climbing up the volcano') # volcano
puts high('take me to semynak') # semynak
puts high('aaa b') # a
