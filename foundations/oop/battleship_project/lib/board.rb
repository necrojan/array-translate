class Board
  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }
    @size = @grid.length * @grid.length
  end

  def self.print_grid(arr)
    arr.each { |ele| puts ele.join(' ') }
  end

  def size
    @size
  end

  def [](arr)
    @grid[arr[0]][arr[1]]
  end

  def []=(pos, val)
    @grid[pos[0]][pos[1]] = val
  end

  def num_ships
    @grid.flatten(1).count(:S)
  end

  def attack(pos)
    if self[pos] == :S
      self[pos] = :H
      puts 'you sunk my battleship!'
      return true
    else
      self[pos] = :X
      return false
    end
  end

  def place_random_ships
    sample = size * 0.25

    while num_ships < sample
      row = rand(0...@grid.length)
      col = rand(0...@grid.length)
      pos = [row, col]
      self[pos] = :S
    end
  end

  def hidden_ships_grid
    @grid.map do |row|
      row.map do |col|
        if col == :S
          :N
        else
          col
        end
      end
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(hidden_ships_grid)
  end
end
