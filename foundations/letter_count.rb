# frozen_string_literal: true

# Change hash key to symbol

def letter_count(str)
  count = Hash.new(0)
  str.chars.each do |ele|
    count[ele] += 1
  end
  count.each_with_object({}) { |(k, v), ele| ele[k.to_sym] = v; }
end

puts letter_count('arithmetics') #=> {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}
