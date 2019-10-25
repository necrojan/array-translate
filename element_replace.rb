def element_replace(arr, hash)
  new_arr = []

  arr.each_with_index do |char, idx|
    if hash.has_key?(char)
      new_arr << hash[char]
    else
      new_arr << char
    end
  end

  return new_arr
end

arr1 = ["LeBron James", "Lionel Messi", "Serena Williams"]
hash1 = {"Serena Williams"=>"tennis", "LeBron James"=>"basketball"}
print element_replace(arr1, hash1) # => ["basketball", "Lionel Messi", "tennis"]
puts

arr2 = ["dog", "cat", "mouse"]
hash2 = {"dog"=>"bork", "cat"=>"meow", "duck"=>"quack"}
print element_replace(arr2, hash2) # => ["bork", "meow", "mouse"]
puts
