# frozen_string_literal: true

# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if empty?

    max - min
  end

  def average
    return nil if empty?

    sum / length.to_f
  end

  def median
    return nil if empty?

    sorted = sort
    len = length
    mid = sorted.length / 2

    sorted.length.odd? ? sorted[mid] : 0.5 * (sorted[mid] + sorted[mid - 1])
  end

  def counts
    count = Hash.new(0)
    each do |ele|
      count[ele] += 1
    end
    count
  end

  def my_count(args)
    count = 0
    each do |ele|
      count += 1 if ele == args
    end
    count
  end

  def my_index(args)
    count = 0
    found = []

    return nil unless include?(args)

    each_with_index do |ele, i|
      if ele == args
        found << i
        count += 1
      end
    end

    if count > 1
      return found.min
    else
      return found[0]
    end
  end

  def my_uniq
    new_arr = []
    each do |ele|
      new_arr << ele unless new_arr.include? ele
    end
    new_arr
  end

  def my_transpose
    new_arr = []

    (0...length).each do |row|
      new_row = []
      (0...length).each do |col|
        new_row << self[col][row]
      end
      new_arr << new_row
    end

    new_arr
  end
end
