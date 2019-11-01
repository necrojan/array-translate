# frozen_string_literal: true

def split_strings(str)
  new_arr = []
  if str.length.odd?
    str.split('').each_with_index do |ele, idx|
      new_arr << if str.size - 1 == idx
                   ele + '_'
                 else
                   ele
                 end
    end
    return new_arr.each_slice(2).map(&:join)
  else
    str.split('').each_slice(2).map(&:join)
  end
end

print split_strings('abc')
puts
print split_strings('abcdef')
