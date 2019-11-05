# frozen_string_literal: true

def is_prime(num)
  return true if num == 2
  return false if (num <= 1) || num.even?

  (3..Math.sqrt(num)).step(2) do |i|
    return false if num % i == 0
  end

  true
end

puts is_prime(1)  # false
puts is_prime(2)  # true
puts is_prime(-1) # false
puts is_prime(958297) # false
