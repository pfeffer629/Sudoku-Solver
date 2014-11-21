class Sudoku
  attr_reader :board_array

  def initialize(board_string)
    @board_string = board_string
    @board_array = board_string.split("").each_slice(9).to_a
  end

  def solve
  end

  def display_board

  end

  # Returns a nicely formatted string representing the current state of the board
  def to_s
  end
end


