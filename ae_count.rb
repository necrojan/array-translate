def ae_count(str)
  count = Hash.new(0)

  str.each_char do |char|
    if char == 'a'
      count[char] += 1
    end
    if char == 'e'
      count[char] += 1
    end
  end

  return count.sort_by { |key| key }.to_h
end

puts ae_count("everyone can program") #=> {"a"=>2, "e"=>3}
puts ae_count("keyboard") #=> {"a"=>1, "e"=>1}
