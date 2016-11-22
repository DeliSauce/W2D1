require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    #"str".colorize(:blue)
    board_size = @board.grid.size
    print "  "
    board_size.times {|col| print " #{col} " }
    board_size.times do |row|
      print "\n"
      board_size.times do |col|
        if col == 0
          print "#{row} "
        end
        pos = [row, col]
        if pos == @cursor.cursor_pos
          print " #{@board[pos].to_s.colorize(:background => :yellow)} "
        else
          print " #{@board[pos].to_s} "
        end
      end
    end
    print "\n"
  end

  def test_loop
    while true
      render
      @cursor.get_input
      system('clear')
    end
  end


end

# display = Display.new(Board.new)
# display.render
