# frozen_string_literal: true

def caesar_cipher(str, num)
  new_str = ''
  alphabet = 'abcdefghijklmnopqrstuvwxyz'

  str.each_char do |char|
    pos = alphabet.index(char) + num
    pos = num - 1 if pos > 25
    new_str += alphabet[pos]
  end
  new_str
end

puts caesar_cipher('apple', 1)    #=> "bqqmf"
puts caesar_cipher('bootcamp', 2) #=> "dqqvecor"
puts caesar_cipher('zebra', 4) #=> "difve"
