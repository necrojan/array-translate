class HumanPlayer
  attr_reader :mark_value

  def initialize(mark_value)
    @mark_value = mark_value
  end

  def get_position
    puts "Player #{mark_value}, enter two number representing a position `row col` with space in between."
    position = gets.chomp.split(' ').map(&:to_i)
    raise 'Invalid, please try again' if position.length != 2
    position
  end
end

