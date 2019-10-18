def two_d_sum(arr)
  count = 0;

  if arr.length == 1
    arr[0].each do |ele|
      count += ele
    end
    return count
  end

  arr.each do |inner_ele|
    inner_ele.each do |ele|
      count += ele
    end
  end

  return count
end

array_1 = [
  [4, 5],
  [1, 3, 7, 1]
]
puts two_d_sum(array_1)    # => 21

array_2 = [
  [3, 3],
  [2],
  [2, 5]
]
puts two_d_sum(array_2)    # => 15
