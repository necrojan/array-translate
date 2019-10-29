def abbrev_name(name)
	return name.split.map { |name| name[0] }.join('.').upcase
end

puts abbrev_name('jan arambulo')