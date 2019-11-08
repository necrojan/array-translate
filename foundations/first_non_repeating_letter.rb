# frozen_string_literal: true

# Write a function named first_non_repeating_letter that takes a string input,
# and returns the first character that is not repeated anywhere in the string.

# For example, if given the input 'stress', the function should return 't',
# since the letter t only occurs once in the string, and occurs first in
# the string.

# As an added challenge, upper- and lowercase letters are considered the
# same character, but the function should return the correct case for the
# initial letter. For example, the input 'sTreSS' should return 'T'.

# If a string contains all repeating characters, it should return an empty
# string ("") or None -- see sample tests.

def first_non_repeating_letter(s)
  first_char = ''
  previous_chars = []

  s.each_char.with_index do |char, i|
    if s[i + 1..-1].downcase.include?(char.downcase)
      previous_chars << char
    else
      unless previous_chars.join('').downcase.include?(char.downcase)
        first_char += char
      end

    end
  end

  if first_char.empty?
    return first_char
  else
    return first_char[0]
  end
end

puts first_non_repeating_letter('stress') # t
puts first_non_repeating_letter('moonmen') # e
puts first_non_repeating_letter('ssssss') # ''
puts first_non_repeating_letter('sTreSS') # T
puts first_non_repeating_letter('ohhjsyLbXOkRRrwqsvSEWmddddwKOsJANSlCWJBZmyEeTBLyjcbczxJQJgQOseBlsdjKPnDzuO') # v
puts first_non_repeating_letter('dNFbrFBOXVwcNKrKHYAFvdpMSftxovaVwEVMFrIqlhHfCmfU') # Y
