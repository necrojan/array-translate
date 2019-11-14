def palindrome?(str)
  new_str = ''
  str.each_char do |char|
    new_str = char + new_str
  end
  if new_str == str
    return true
  else
    return false
  end
end

def substrings(str)
  new_arr = []
  (0...str.length).each do |strt_idx|
    (strt_idx...str.length).each do |end_idx|
      new_arr << str[strt_idx..end_idx]
    end
  end
  new_arr
end

def palindrome_substrings(string)
  arr = []
  substrings(string).each do |char|
    if (palindrome?(char) && char.length > 1)
      arr << char
    end
  end
  arr
end