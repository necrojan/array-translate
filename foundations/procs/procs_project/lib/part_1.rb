# frozen_string_literal: true

def my_map(arr, &prc)
  new_arr = []
  arr.each do |ele|
    new_arr << prc.call(ele)
  end
  new_arr
end

def my_select(arr, &prc)
  new_arr = []
  arr.each do |ele|
    new_arr << ele if prc.call(ele)
  end
  new_arr
end

def my_count(arr, &prc)
  count = []
  arr.each do |ele|
    count << ele if prc.call(ele)
  end
  count.length
end

def my_any?(arr, &prc)
  new_arr = []
  arr.each do |ele|
    new_arr << ele if prc.call(ele)
  end
  if new_arr.empty?
    return false
  else
    return true
  end
end

def my_all?(arr, &proc)
  arr.each do |ele|
    return false unless proc.call(ele)
  end
  true
end

def my_none?(arr, &proc)
  arr.each do |ele|
    return false if proc.call(ele)
  end
  true
end
