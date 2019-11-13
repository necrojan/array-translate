def hipsterfy(word)
  word.reverse.sub(/[aeiou]/, '').reverse
end

def vowel_counts(str)
  vowels = 'aeiou'
  count = Hash.new(0)
  str.each_char do |char|
    if vowels.include?(char.downcase)
      count[char.downcase] += 1
    end
  end

  count
end

def caesar_cipher(msg, n)
  alphabet = 'abcdefghijklmnopqrstuvwxyz'
  new_str = ''

  msg.chars.each_with_index do |char, i|
    if alphabet.include?(char)
      pos = alphabet.index(char) + n
      new_str += alphabet[pos % 26]
    else
      new_str += char
    end
  end

  new_str
end
