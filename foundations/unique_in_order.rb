def unique_in_order(iterable)
  if iterable.is_a? Enumerable
    remove_duplicates(iterable)
  else
    chars = iterable.split('')
    remove_duplicates(chars)
  end
end

def remove_duplicates(iterable)
  collapse = true
  while collapse
    collapse = false
    iterable.each_with_index do |char, i|
      if iterable[i] == iterable[i + 1]
        iterable[i] = ''
        collapse = true
        break
      end
    end
  end
  return iterable.reject { |ele| ele.to_s.empty? }
end


print unique_in_order('AABBCCABC') # == ['A', 'B', 'C', 'D', 'A', 'B']
puts
print unique_in_order('ABBCcAD')         # == ['A', 'B', 'C', 'c', 'A', 'D']
puts
print unique_in_order([1,2,2,3,3])       # == [1,2,3]