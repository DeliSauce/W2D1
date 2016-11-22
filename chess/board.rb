require_relative 'piece'

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8){ Array.new(8)}
    populate_board
  end

  def populate_board
    @grid.each_with_index do |rows, row|
      rows.each_with_index do |space, col|
        pos = [row, col]
        @grid[row][col] = piece_type(pos)
      end
    end
  end

  def piece_type(pos)
    row, col = pos
    if row == 1 || row == 6
      Pawn.new(pos, self)
    elsif row >= 2 && row <= 5
      NullPiece.new(pos, self)
    else
      if col == 0 || col == 7
        Rook.new(pos, self)
      elsif col == 1 || col == 6
        Knight.new(pos, self)
      elsif col == 2 || col == 5
        Bishop.new(pos, self)
      elsif col == 3
        King.new(pos, self)
      elsif col == 4
        Queen.new(pos, self)
      end
    end
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  #need to update to take other players piece & valid move?
  def move_piece(start_pos, end_pos)
    if self[start_pos].is_a?(NullPiece)
      raise StandardError.new("There is no piece at this start position")
    end
    unless valid_pos?(end_pos)
      raise StandardError.new("End position does not exist")
    end

    current_piece = self[start_pos]
    self[end_pos] = current_piece
    self[start_pos] = NullPiece.new
  end

  def valid_pos?(pos)
    row, col = pos
    if (0..7).include?(row) && (0..7).include?(col)
      true
    else
      false
    end
  end

end

# board = Board.new
# start_pos = [3, 3]
# end_pos = [2, 2]
# board.move_piece(start_pos, end_pos)
# p board[start_pos]
# p board[end_pos]
