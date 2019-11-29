def proper_factors(num)
  (1...num).select { |ele| num % ele == 0 }
end

def aliquot_sum(num)
  proper_factors(num).sum
end

def perfect_number?(num)
  sum = aliquot_sum(num)
  if sum == num
    return true
  else
    return false
  end
end

def ideal_numbers(n)
  i = 1
  nums = []

  while nums.length < n
    nums << i if perfect_number?(i)
    i += 1
  end
  nums
end