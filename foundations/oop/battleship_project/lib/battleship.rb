require_relative "board"
require_relative "player"

class Battleship

  attr_reader :board, :player 
  # n represent the length of the board
  def initialize(n)
    @player = Player.new
    @board = Board.new(n)
    @remaining_misses = @board.size / 2
  end

  def start_game
    board.place_random_ships
    puts "There are #{@board.num_ships} hidden ships on the board."
    board.print
  end

  def lose?
    if @remaining_misses <= 0
      puts 'you lose'
      return true
    else
      return false
    end
  end

  def win?
    if board.num_ships == 0
      print 'you win'
      return true
    else
      return false
    end
  end

  def game_over?
    win? or lose? ? true : false
  end

  def turn
    move = @player.get_move
    attack = board.attack(move)
    board.print

    if !attack
      @remaining_misses -= 1
    end
    puts @remaining_misses
  end
end
