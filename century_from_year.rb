# frozen_string_literal: true

def century_from_year(year)
  count = ''
  count = if year < 100
            1
          elsif year % 100 == 0
            year / 100
          else
            year / 100 + 1
  end
end

puts century_from_year(1801)
puts century_from_year(2001)
puts century_from_year(1400)