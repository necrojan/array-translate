def partition(arr, num)
  new_arr = Array.new(2) { Array.new() }
  arr.each do |char|
    if char < num
      new_arr[0] << char
    else
      new_arr[1] << char
    end
  end
  new_arr
end


def merge(hash_1, hash_2)
  hash_1.merge(hash_2)
end

def censor(sentence, arr)
  words = sentence.split(' ').map do |char|
    if arr.include?(char.downcase)
      char.gsub(/[aeiouAEIOU]/, '*')
    else
      char
    end
  end
  words.join(' ')
end


def power_of_two?(num)
  # binary representation
  # 4 - 3
  # 100 & 011 = 000
  num & (num - 1) == 0
end

