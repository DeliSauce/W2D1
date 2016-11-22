class Piece

  def initialize
  end

  def moves
    possible_moves []
  end

  def to_s
  end

end

class Pawn < Piece
  def to_s
    "P"
  end
end

class NotPawn < Piece
  def to_s
    "N"
  end
end

# class Bishop < Piece
#   include SlidingPiece
# end
#
# class Queen < Piece
#   include SlidingPiece
# end
#
# class Rook < Piece
#   include SlidingPiece
# end
#
# class Knight < Piece
#   include SteppingPiece
# end
#
# class King < Piece
#   include SteppingPiece
# end

class NullPiece < Piece
  def to_s
    "_"
  end
  # include Singleton
end
