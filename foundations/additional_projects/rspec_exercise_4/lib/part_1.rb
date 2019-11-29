def my_reject(arr, &proc)
  new_arr = []
  arr.each do |ele|
    new_arr << ele if !proc.call(ele)
  end
  new_arr
end

def my_one?(arr, &proc)
  arr.count(&proc) == 1
end

def hash_select(hash, &proc)
  selected = {}
  hash.each do |k, v|
    selected[k] = v if proc.call(k, v)
  end
  selected
end

def xor_select(arr, proc_1, proc_2)
  arr.select do |ele|
    (proc_1.call(ele) || proc_2.call(ele)) && !(proc_1.call(ele) && proc_2.call(ele))
  end
end

def proc_count(val, proc)
  proc.count { |prc| prc.call(val) }
end
