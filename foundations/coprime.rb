def coprime?(num_1, num_2)
  (2..num_1).each do |div|
    return false if num_1 % div == 0 && num_2 % div == 0
  end
  true
end

p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false