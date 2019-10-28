# frozen_string_literal: true

def greatest_factor_array(arr)
  new_arr = arr.map do |num|
    if num.even?
      greatest_factor(num)
    else
      num
    end
  end

  new_arr
end

def greatest_factor(num)
  (1...num).reverse_each do |i|
    return i if num % i == 0
  end
end

# puts greatest_factor(14)

print greatest_factor_array([16, 7, 9, 14]) # => [8, 7, 9, 7]
puts
print greatest_factor_array([30, 3, 24, 21, 10]) # => [15, 3, 12, 21, 5]
puts
