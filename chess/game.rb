require_relative 'board'
require_relative 'display'

class Game
  def initialize
    @board = Board.new
    @display = Display.new(@board)
  end

  def run
    @display.test_loop
  end

end


if $PROGRAM_NAME == __FILE__
  game = Game.new
  game.run
end
