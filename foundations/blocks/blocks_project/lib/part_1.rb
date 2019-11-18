def select_even_nums(nums)
  nums.select { |num| num.even? }
end

def reject_puppies(arr)
  arr.reject { |k, v| k['age'] <= 2 }
end

def count_positive_subarrays(arr)
  arr.count { |v| v.sum > 0 }
end

def aba_translate(str)
  vowels = 'aeiou'
  new_word = ''

  str.each_char do |char|
    if vowels.include?(char)
      new_word += char + 'b' + char
    else
      new_word += char
    end
  end
  
  new_word
end

def aba_array(arr)
  arr.map do |char|
    aba_translate(char)
  end
end