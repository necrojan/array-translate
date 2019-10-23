# Hint: all keys of a hash are automatically unique

def unique_elements(arr)
  new_arr = []
  count = Hash.new(0)

  arr.each do |v|
    count[v] += 1
  end

  count.each_key do |k|
    new_arr << k
  end

  return new_arr
end

print unique_elements(['a', 'b', 'a', 'a', 'b', 'c']) #=> ["a", "b", "c"]
puts
