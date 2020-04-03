class ComputerPlayer
  attr_reader :mark_value

  def initialize(mark_value)
    @mark_value = mark_value
  end

  def get_position(legal_positions)
    comp_position = legal_positions.sample
    puts "Computer player #{mark_value} with position #{comp_position.to_s}"
    comp_position
  end
end