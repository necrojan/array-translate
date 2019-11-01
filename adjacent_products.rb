# frozen_string_literal: true

def adjacent_products(arr)
  arr.each_cons(2).max_by { |x, y| x * y }.reduce(:*)
end

print adjacent_products([2, 3, -1, 2, 7, 3])
