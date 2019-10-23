def hand_score(hand)
  total = 0
  hash = {
    "a" => 4,
    "k" => 3,
    "q" => 2,
    "j" => 1
  }

  hand.each_char do |v|
    total += hash[v.downcase]
  end
  return total
end

puts hand_score("AQAJ") #=> 11
puts hand_score("jJka") #=> 9
