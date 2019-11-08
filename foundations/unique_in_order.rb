# frozen_string_literal: true

def unique_in_order(iterable)
  new_arr = []
  if iterable.is_a? Enumerable
    return get_items(iterable)
  else
    chars = iterable.split('')
    return get_items(chars)
  end
end

def get_items(chars)
  new_arr = []
  chars.each_with_index do |_char, i|
    if chars[i] == chars[i + 1]
      chars[i] = ''
    else
      new_arr << chars[i]
    end
  end
  new_arr
end

print unique_in_order('AAAABBBCCDAABBB') # == ['A', 'B', 'C', 'D', 'A', 'B']
puts
print unique_in_order('ABBCcAD')         # == ['A', 'B', 'C', 'c', 'A', 'D']
puts
print unique_in_order([1, 2, 2, 3, 3]) # == [1,2,3]
