def frequent_letters(string)
  arr = []
  count = Hash.new(0)

  string.each_char do |char|
    count[char] += 1
    if count[char] > 2
      arr << char
    end
  end

  return arr.uniq.sort
end

print frequent_letters('mississippi') #=> ["i", "s"]
puts
print frequent_letters('bootcamp') #=> []
puts
