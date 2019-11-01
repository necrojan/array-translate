# frozen_string_literal: true

def consonant_cancel(sentence)
  new_sentence = []

  sentence.split(' ').each do |word|
    new_sentence << remove_first_letter(word)
  end

  new_sentence.join(' ')
end

def remove_first_letter(word)
  vowels = 'aieou'

  word.each_char.with_index do |char, idx|
    return word[idx..-1] if vowels.include?(char)
  end
end

puts consonant_cancel('down the rabbit hole') #=> "own e abbit ole"
puts consonant_cancel('writing code is challenging') #=> "iting ode is allenging"
