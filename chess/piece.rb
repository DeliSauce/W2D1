class Piece

  PIECE_TYPES = { pawn: "P",
                  bishop: "B",
                  queen: "Q",
                  king: "K",
                  knight: "k",
                  rook: "R",
                  null: "_",
                  nil: "X"}

  def initialize(pos, board)
    @current_pos = pos
    @board = board
    @type = nil
  end

  def moves
    possible_moves []
  end

  def to_s
    PIECE_TYPES[@type]
  end

end

class Pawn < Piece
  def initialize(pos, board)
    super(pos, board)
    @type = :pawn
  end
end


class Bishop < Piece
  # include SlidingPiece
  def initialize(pos, board)
    super(pos, board)
    @type = :bishop
  end
end

class Queen < Piece
  # include SlidingPiece
  def initialize(pos, board)
    super(pos, board)
    @type = :queen
  end
end

class Rook < Piece
  # include SlidingPiece
  def initialize(pos, board)
    super(pos, board)
    @type = :rook
  end
end

class Knight < Piece
  # include SteppingPiece
  def initialize(pos, board)
    super(pos, board)
    @type = :knight
  end
end

class King < Piece
  # include SteppingPiece
  def initialize(pos, board)
    super(pos, board)
    @type = :king
  end
end

class NullPiece < Piece
  def initialize(pos, board)
    super(pos, board)
    @type = :null
  end
  # include Singleton
end
