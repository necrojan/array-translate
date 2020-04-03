class HumanPlayer
  attr_reader :mark_value

  def initialize(mark_value)
    @mark_value = mark_value
  end

  def get_position(legal_positions)
    position = nil
    until legal_positions.include?(position)
      puts "Player #{mark_value.to_s}, enter two number representing a position `row col` with space in between."
      position = gets.chomp.split(' ').map(&:to_i)
      puts "#{position} is not a legal position" if !legal_positions.include?(position)
      rais 'Sorry, that was invalid' if position.length != 2
    end
    position
  end
end

