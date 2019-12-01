def zip(*nums)
  length = nums.first.length

  (0...length).map do |i|
      nums.map { |arr| arr[i] }
  end
end

def prizz_proc(arr, proc_1, proc_2)
  arr.select do |ele|
    (proc_1.call(ele) && !proc_2.call(ele)) || (!proc_1.call(ele) && proc_2.call(ele))
  end
end

def zany_zip(*nums)
  length = nums.map(&:length).max

  (0...length).map do |i|
    nums.map { |arr| arr[i] }
  end
end

def maximum(arr, &proc)
  return nil if arr.empty?
  max = arr.first

  arr.each do |i|
    max = i if proc.call(i) >= proc.call(max)
  end

  max
end

def my_group_by(arr, &proc)
  groups = Hash.new { |h, k| h[k] = [] }
  arr.each do |i|
    keys = proc.call(i)
    groups[keys] << i
  end
  groups
end

def max_tie_breaker(arr, tie_breaker, &proc)
  return nil if arr.empty?
  max = arr.first
  arr.each do |i|
    result_el = proc.call(i)
    result_max = proc.call(max)
    if result_el > result_max
      max = i
    elsif result_el == result_max && tie_breaker.call(i) > tie_breaker.call(max)
      max = i
    end
  end
  max
end

def silly_syllables(sentence)
  words = sentence.split(' ')
  new_words = words.map do |ele|
    indices = vowel_indices(ele)
    if indices.length < 2
      ele
    else
      ele[indices.first..indices.last]
    end
  end
  new_words.join(' ')
end

def vowel_indices(word)
  vowels = 'aeiou'
  indices = []
  word.each_char.with_index do |ele, i|
    indices << i if vowels.include?(ele)
  end
  indices
end


puts silly_syllables('trashcans collect garbage')
