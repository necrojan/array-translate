def is_valid_email(str)
  words = str.split('@')
  yes = str.include? '@'

  if yes && words[0].count('/A-Z0-9/') == 0 && words[1].count('.') == 1
    return true
  else
    return false
  end
end

puts is_valid_email("aba@xy.z")         # => true
puts is_valid_email("jdo@gmail.com")    # => true
puts is_valid_email("jdoe@g@mail.com")  # => false
puts is_valid_email("jdoe42@gmail.com") # => false
puts is_valid_email("jdoegmail.com")    # => false
puts is_valid_email("az@email")         # => false
