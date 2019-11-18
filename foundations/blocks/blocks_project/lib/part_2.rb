def all_words_capitalized?(arr)
  arr.all? { |word| word.capitalize == word }
end

def no_valid_url?(arr)
  valid_endings = [".com", ".net", ".io", ".org"]
  arr.none? do |char|
    valid_endings.any? { |ending| char.end_with?(ending) }
  end
end

def any_passing_students?(students)
  students.any? do |student|
    average = student[:grades].sum / student[:grades].length * 1.0
    average >= 75
  end
end