# frozen_string_literal: true

def bubble_sort(array)
  sorted = false

  until sorted
    sorted = true
    (0...array.length - 1).each do |i|
      if array[i] > array[i + 1]
        array[i], array[i + 1] = array[i + 1], array[i]
        sorted = false
      end
    end
  end
  array
end

p bubble_sort([8, 2, 3, 7, 1, 4, 5, 6])
p bubble_sort([5, 3, 1, 2, 4])
p bubble_sort([5, 5, 1, 2, 4])
