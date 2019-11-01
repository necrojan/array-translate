# frozen_string_literal: true

def same_char_collapses(str)
  collapse = true

  while collapse
    collapse = false
    chars = str.split('')
    chars.each_with_index do |_char, i|
      next unless chars[i] == chars[i + 1]

      chars[i] = ''
      chars[i + 1] = ''
      collapse = true
      break
    end
    str = chars.join('')
  end

  str
end

puts same_char_collapses('zzzxaaxy') #=> "zy"

puts same_char_collapses('uqrssrqvtt') #=> "uv"
