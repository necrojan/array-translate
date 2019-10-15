# Pig latin translation uses the following rules:
# - for words that start with a vowel, add 'yay' to the end
# - for words that start with a nonvowel, move all letters before the first vowel to the end of the word and add 'ay'

def pig_latin_word(word)
  vowels = 'aeiou'
  non_vowels = ''

  if vowels.include? word.chars.first
    word += 'yay'

    return word
  end

  i = 0
  while word.length != 0
    if !vowels.include? word[i]
      non_vowels += word.slice!(word[i])
    else
      return word + non_vowels + 'ay'
    end
  end
end

puts pig_latin_word("apple")   # => "appleyay"
puts pig_latin_word("eat")     # => "eatyay"
puts pig_latin_word("banana")  # => "ananabay"
puts pig_latin_word("trash")   # => "ashtray"
