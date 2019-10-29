# frozen_string_literal: true

def vowel_cipher(string)
  vowels = 'aeiou'
  len = vowels.length - 1
  new_str = ''

  string.each_char do |char|
    pos = vowels.index(char)
    new_str += if pos.nil?
                 char
               elsif pos >= len
                 vowels[pos - len]
               else
                 vowels[pos + 1]
               end
  end

  new_str
end

puts vowel_cipher('bootcamp') #=> buutcemp
puts vowel_cipher('paper cup') #=> pepir cap
