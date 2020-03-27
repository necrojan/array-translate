require './board'
require './human_player'

class Game
  def initialize(n, *args)
    @players = []
    args.each do |player|
      @players << HumanPlayer.new(player)
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
      current_player_position = @current_player.get_position
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
