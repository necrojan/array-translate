# frozen_string_literal: true

class Code
  POSSIBLE_PEGS = {
    'R' => :red,
    'G' => :green,
    'B' => :blue,
    'Y' => :yellow
  }.freeze

  def self.valid_pegs?(arr)
    arr.all? { |ele| Code::POSSIBLE_PEGS.include?(ele.upcase) }
  end

  def self.random(length)
    pegs = Array.new(length) { Code::POSSIBLE_PEGS.keys.sample }
    Code.new(pegs)
  end

  def self.from_string(string)
    Code.new(string.split(''))
  end

  def initialize(pegs)
    raise unless Code.valid_pegs?(pegs)

    @pegs = pegs.map(&:upcase)
  end

  attr_reader :pegs

  def [](idx)
    @pegs[idx]
  end

  def length
    pegs.count
  end

  def num_exact_matches(code)
    (0...code.length).count { |i| code[i] == @pegs[i] }
  end

  def num_near_matches(code)
    matches = (0...code.length).count do |i|
      @pegs.include?(code[i])
    end

    matches - num_exact_matches(code)
  end

  def ==(code)
    length == code.length && num_exact_matches(code) == length
  end
end
