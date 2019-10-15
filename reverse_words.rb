def reverse_words(sent)
  new_words = []
  words = sent.split(' ')
  words.each do |word|
    new_words << word.reverse
  end
  return new_words.join(' ')
end

puts reverse_words('keep coding') # => 'peek gnidoc'
puts reverse_words('simplicity is prerequisite for reliability') # => 'yticilpmis si etisiuqererp rof ytilibailer'
