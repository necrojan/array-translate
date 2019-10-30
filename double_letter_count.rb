# frozen_string_literal: true

def double_letter_count(string)
  count = 0

  string.each_char.with_index do |_char, i|
    count += 1 if string[i] == string[i + 1]
  end

  count
end

puts double_letter_count('the jeep rolled down the hill') #=> 3
puts double_letter_count('bootcamp') #=> 1
