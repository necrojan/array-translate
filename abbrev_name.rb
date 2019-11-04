# frozen_string_literal: true

def abbrev_name(name)
  name.split.map { |name| name[0] }.join('.').upcase
end

puts abbrev_name('jan arambulo')
