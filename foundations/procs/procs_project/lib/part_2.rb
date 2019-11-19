def reverser(str, &proc)
  reverse = ''
  str.each_char do |char|
    reverse = char + reverse
  end
  proc.call(reverse)
end

def word_changer(str, &proc)
  sentence = []
  str.split(' ').each do |char|
    sentence << proc.call(char)
  end
  sentence.join(' ')
end

def greater_proc_value(num, proc1, proc2)
  result_1 = proc1.call(num)
  result_2 = proc2.call(num)
  if result_1 > result_2
    return result_1
  else
    return result_2
  end
end

def and_selector(arr, proc1, proc2)
  new_arr = []
  arr.select do |ele|
    if proc1.call(ele) && proc2.call(ele)
      new_arr << ele
    end
  end
  new_arr
end

def alternating_mapper(arr, proc1, proc2)
  new_arr = []
  arr.each_with_index do |ele, i|
    if i.even?
      new_arr << proc1.call(ele)
    else
      new_arr << proc2.call(ele)
    end
  end
  new_arr
end

half = Proc.new { |n| n / 2.0 }
times_thousand = Proc.new { |n| n * 1000 }
p alternating_mapper([1,10,4,7,5], half, times_thousand)