def most_vowels(sentence)
  vowels = 'aeiou'
  count = Hash.new(0)
  words = sentence.split(' ')

  words.each do |word|
    word.each_char do |ele|
      if vowels.include?(ele)
        count[word] += 1
      end
    end
  end

  return count.key(count.values.max)
end

print most_vowels("what bb wonderful life") #=> "wonderful"
