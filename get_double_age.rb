def get_double_age(hash)
  hash.each do |k, v|
    if k == 'age'
      hash[k] = v * 2
    end
  end
  return hash
end
