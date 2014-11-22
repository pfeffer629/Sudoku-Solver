=begin
### Sudocode ###
Input: string of integer AND "-"
Output: string of 81 integers. (Solved board)
0) Create a 9x9 grid(array);
---Create 2 nested arrays (1 for cell; 1 for row, 1 for board)

1) Find next empty cell
---
2) Look at related sets (Row/Column/3x3 Sub-grid)
---
3) Find cell possibilities
---
4) Check if unique solution
---if so, enter it

Input: -5--367-3-18---"
=end

class Board
  attr_accessor :board_string, :board_array

  def initialize(board_string)
    @board_string = board_string
    @board_array = []
  end

  def create_board
    temp_board_arr = @board_string.split("")
    (0..8).each {|row|
      @board_array[row] = []
      (0..8).each {|column|
        @board_array[row][column] = temp_board_arr.shift
      }
    }
    return @board_array
  end

  def print_board
    @board_array.length.times do |row|
      puts @board_array[row].join(" ")
    end
  end

end

class Sudoku
  attr_accessor :board_array

  def initialize(board_string)
    @board_array = Board.new(board_string).board_array

    p @board_array
  end

  def solve
    puts "we r in the solve method now :-)"
  end

  def find_empty_cell
    puts "inside find_empty_cell"
    p @board_array
  end

  def board
    puts "board"
  end

  # Returns a nicely formatted string representing the current state of the board
  def to_s
    puts "to_s"
  end

end
