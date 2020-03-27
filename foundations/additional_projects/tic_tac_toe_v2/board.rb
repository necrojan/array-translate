class Board
  attr_reader :grid

  def initialize(n)
    @grid = Array.new(n) { Array.new(n, '_') }
  end

  def valid?(pos)
    pos.all? do |i|
      i >= 0 && i < @grid.length
    end
  end

  def empty?(pos)
    self[pos] == '_'
  end

  def place_mark(pos, mark)
    raise 'invalid mark' if !valid?(pos) || !empty?(pos)

    self[pos] = mark
  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def []=(pos, val)
    @grid[pos[0]][pos[1]] = val
  end

  def print
    grid.each do |row|
      puts row.join(' ')
    end
  end

  def win_row?(mark)
    grid.any? { |row| row.all?(mark) }
  end

  def win_col?(mark)
    grid.transpose.any? { |col| col.all?(mark) }
  end

  def win_diagonal?(mark)
    left_to_right = (0...grid.length).all? do |i|
      pos = [i, i]
      self[pos] == mark
    end
    right_to_left = (0...grid.length).all? do |i|
      row = i
      col = grid.length - 1 - i
      pos = [row, col]
      self[pos] == mark
    end
    left_to_right || right_to_left
  end

  def win?(mark)
    return false if !win_row?(mark) && !win_col?(mark) && !win_diagonal?(mark)
    true
  end

  def empty_positions?
    # this returns [0, 1, 2]
    indices = (0...grid.length).to_a
    # get all the posible positions of the given array
    # [0, 0], [0, 1], [0, 2], [1, 0], [1, 1], [1, 2], [2, 0], [2, 1], [2, 2]
    items = indices.product(indices)
    items.any? { |pos| empty?(pos) }
  end

end

# b = Board.new
# b.place_mark([1, 2], :X)
# b.place_mark([0, 0], :O)
# b.place_mark([0, 1], :O)
# b.place_mark([0, 2], :O)
# b.place_mark([1, 1], :X)
# b.place_mark([1, 0], :X)
# b.place_mark([2, 0], :X)
# b.place_mark([2, 1], :X)

# # b.place_mark([2, 2], :X)
# # b.place_mark([1, 1], :O)
# # b.place_mark([2, 1], :O)
# # b.print
# # p b.win_row?(:X)
# # p b.win_col?(:X)
# # p b.win_diagonal?(:O)
# # p b.win?(:O)
# p b.print
# p b.empty_positions?