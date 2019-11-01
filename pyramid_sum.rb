# frozen_string_literal: true

# For example, the base [1, 4, 6] gives us the following pyramid
#     15
#   5   10
# 1   4    6

def pyramid_sum(base)
  pyramid = [base]

  pyramid.unshift(adjacent_sum(pyramid[0])) while pyramid.length < base.length

  pyramid
end

def adjacent_sum(arr)
  i = 0
  new_arr = []

  while i < arr.length
    new_arr << arr[i] + arr[i + 1] if i != arr.length - 1
    i += 1
  end
  new_arr
end

print pyramid_sum([1, 4, 6]) #=> [[15], [5, 10], [1, 4, 6]]
puts

print pyramid_sum([3, 7, 2, 11]) #=> [[41], [19, 22], [10, 9, 13], [3, 7, 2, 11]]
puts
