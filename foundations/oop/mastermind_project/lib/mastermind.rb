# frozen_string_literal: true

require_relative 'code'

class Mastermind
  def initialize(length)
    @secret_code = Code.random(length)
  end

  def print_matches(code)
    puts "num of exact matches: #{@secret_code.num_exact_matches(code)}"
    puts "num of near matches: #{@secret_code.num_near_matches(code)}"
  end

  def ask_user_for_guess
    puts 'Enter a code'
    input = gets.chomp
    matches = Code.from_string(input)
    print_matches(matches)
    @secret_code == matches
  end
end
