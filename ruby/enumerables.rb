class Array
  def my_each(&proc)
    length.times do |num|
      proc.call(self[num])
    end
    self
  end

  def my_select(&proc)
    select = []

    my_each do |ele|
      select << ele if proc.call(ele)
    end
    select
  end

  def my_reject(&proc)
    new_arr = []
    my_each do |ele|
      new_arr << ele unless proc.call(ele)
    end
    
    new_arr
  end

  def my_any?(&proc)
    my_each do |ele|
      return true if proc.call(ele)
    end
    false
  end

  def my_all?(&proc)
    my_each do |ele|
      return false unless proc.call(ele)
    end

    true
  end

  def my_flatten
    flattened = []

    my_each do |ele|
      if ele.is_a? Array
        flattened.concat(ele.my_flatten)
      else
        flattened << ele
      end
    end

    flattened
  end

  def my_zip(*args)
    zipped = []

    length.times do |i|
      sub_arr = [self[i]]
      args.my_each do |arr|
        sub_arr << arr[i]
      end

      zipped << sub_arr
    end

    zipped
  end
end