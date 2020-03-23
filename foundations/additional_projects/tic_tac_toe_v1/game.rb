require './board.rb'
require './human_player.rb'

class Game
  def initialize(player_1, player_2)
    @player_1 = HumanPlayer.new(player_1)
    @player_2 = HumanPlayer.new(player_2)
    @current_player = @player_1
    @board = Board.new
  end

  def switch_turn
    if @current_player == @player_1
      @current_player = @player_2
    else
      @current_player = @player_1
    end
  end

  def play
    @board.print
    while @board.empty_positions?
      @board.print
      pos = @current_player.get_position
      @board.place_mark(pos, @current_player.mark_value)

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