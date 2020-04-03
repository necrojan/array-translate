require './board'
require './human_player'
require './computer_player'

class Game
  def initialize(n, players)
    @players = players.map do |mark, is_computer|
      is_computer ? ComputerPlayer.new(mark) : HumanPlayer.new(mark)
    end
    @current_player = @players.first
    @board = Board.new(n)
  end

  def switch_turn
    @current_player = @players.rotate!
    @current_player = @current_player.first
  end

  def play
    while @board.empty_positions?
      @board.print
      choices = @board.legal_positions
      current_player_position = @current_player.get_position(choices)
      @board.place_mark(current_player_position, @current_player.mark_value)
      if @board.win?(@current_player.mark_value) 
        puts 'Victory!'
        puts @current_player.mark_value.to_s + ' has won!'
        return
      else
        switch_turn
      end
    end

    puts 'Its a draw'
    puts 'GAME OVER'
  end
end
