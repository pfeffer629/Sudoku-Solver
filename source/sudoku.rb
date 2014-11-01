require 'pry'
require 'pry-byebug'

class Sudoku

  attr_reader :empty_cells

  def initialize(board_string)
    @board_string = board_string
    @board = []
    convert_board_string
  end

  def convert_board_string
    chars_with_quad = @board_string.chars.map.with_index do |char, i|
      [char, (((i / 27) * 3 + (i % 9) / 3))]
    end
    chars_with_quad.each_slice(9) {|row| @board << row }
  end

  def solved?
    board.each { |row| row.each { |cell| return false if cell.first == "-" } }
    true
  end

  def find_all_empty_cells
    @empty_cells = []
    board.each_index do |row_i|
      board[row_i].each_index do |col_i|
        if board[row_i][col_i].first == '-'
          @empty_cells << [row_i, col_i]
        end
      end
    end
  end

  def row_values row
    board[row].map(&:first)
  end

  def col_values col
    board.map { |row| row[col].first }
  end

  def quad_values quadrant
    values = []
    board.each_index do |row_i|
      board[row_i].each_index do |col_i|
        values <<  board[row_i][col_i].first if board[row_i][col_i].last == quadrant
      end
    end
    values
  end

  def get_cell_quadrant row_i, col_i
    board[row_i, col_i].last
    # (col_i / 3 + 1 ) * (row_i / 3 + 1)
  end

  def get_cell_non_candidates row_i, col_i
    @related_cell_values = nil
    @related_cell_values = row_values(row_i) +
                           col_values(col_i)
                           quad_values(get_cell_quadrant(row_i,col_i))
    @related_cell_values.delete('-')
    @related_cell_values
  end

  def unique_candidate
    if (unique_vals = @related_cell_values.uniq).size == 8
      (["1","2","3","4","5","6","7","8","9"] - unique_vals).first
    end
  end

  def solve
    until solved?
      binding.pry
      find_all_empty_cells
      empty_cells.each do |(row_i, col_i)|
        get_cell_non_candidates row_i, col_i
        if cell_solution = unique_candidate
          @board[row_i][col_i][0] = cell_solution
        end
      end
    end
  end

  def board
    @board
  end

  # Returns a nicely formatted string representing the current state of the board
  def to_s
    board
  end
end

=begin
sudoku_board = Sudoku.new("123456789")
# sudoku_board.convert_board_string
p sudoku_board.board == [["1","2","3","4","5","6","7","8","9"]]
p sudoku_board.row_values(0) == ["1","2","3","4","5","6","7","8","9"]
p sudoku_board.col_values(0) == ["1"]
p sudoku_board.solved? == true

unsolved_sudoku_board = Sudoku.new("123456--9")
# unsolved_sudoku_board.convert_board_string
p unsolved_sudoku_board.solved? == false
# p unsolved_sudoku_board.find_empty_cell == [0,6]
p unsolved_sudoku_board.get_cell_quadrant(0,0) == 1
p unsolved_sudoku_board.get_cell_quadrant(0,3) == 2
p unsolved_sudoku_board.get_cell_quadrant(0,8) == 3
p unsolved_sudoku_board.get_cell_quadrant(0,7) == 3
p unsolved_sudoku_board.quad_values(3) == ['-','-','9']

board2 = Sudoku.new("---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---")
# p board2.board
# p board2.get_cell_non_candidates(0,7)
# p board2.unique_candidate
# p board2.find_empty_cell

board3 = Sudoku.new("435269781682571493197834562826195347374682915951743628519326874248957136763418259")

p board3.solved? == true

board4 = Sudoku.new("4-5269781682571493197834562826195347374682915951743628519326874248957136763418259")

board4.solve
p board4.solved?
p board4.board

board5 = Sudoku.new("4-52-9781682571493197834562826195347374682915951743628519326874248957136763418259")

board5.solve
p board5.solved?
p board5.board

=begin

[["-", "-", "-", "2", "6", "-", "7", "-", "1"],
 ["6", "8", "-", "-", "7", "-", "-", "9", "-"],
 ["1", "9", "-", "-", "-", "4", "5", "-", "-"],
 ["8", "2", "-", "1", "-", "-", "-", "4", "-"],
 ["-", "-", "4", "6", "-", "2", "9", "-", "-"],
 ["-", "5", "-", "-", "-", "3", "-", "2", "8"],
 ["-", "-", "9", "3", "-", "-", "-", "7", "4"],
 ["-", "4", "-", "-", "5", "-", "-", "3", "6"],
 ["7", "-", "3", "-", "1", "8", "-", "-", "-"]]

=end

board5 = Sudoku.new("4-52-9781682571493197834562826195347374682915951743628519326874248957136763418259")

p board5.board
