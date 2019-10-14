def array_translate(array)
  new_string = ''
  new_value = ''

  array.each do |char|
    if char.is_a? Integer
      new_value += new_string * char
      new_string = ''
    else
      new_string += char
    end
  end

  return new_value
end

print array_translate(["Cat", 2, "Dog", 3, "Mouse", 1]); # => "CatCatDogDogDogMouse"
puts

print array_translate(["red", 3, "blue", 1]); # => "redredredblue"
puts
