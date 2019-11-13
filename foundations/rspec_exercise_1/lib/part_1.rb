# frozen_string_literal: true

def average(num_1, num_2)
  sum = num_1.to_f + num_2.to_f
  sum / 2
end

def average_array(args)
  args.inject { |sum, ele| sum + ele }.to_f / args.size
end

def repeat(str, num)
  str * num
end

def yell(str)
  str.upcase + '!'
end

def alternating_case(sentence)
  new_words = []
  words = sentence.split(' ')
  words.each_with_index do |word, i|
    if i.even?
      new_words << word.upcase
    else
      new_words << word.downcase
    end
  end
  new_words.join(' ')
end