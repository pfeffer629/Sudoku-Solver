#require_relative('sudoku_puzzles.txt')
require 'matrix'

SIXTEENCELL = {:base_box_0 => [[0,0],[0,1],[1,0],[1,1]],
  :base_box_1 => [[0,2],[0,3],[1,2],[1,3]],
  :base_box_2 => [[2,0],[2,1],[3,0],[3,1]],
  :base_box_3 => [[2,2],[2,3],[3,2],[3,3]]}
SIXTEENCELL_KNOWNS = ["1","2","3","4"]
# EIGHTYONECELL = {:base_box_0 => ,
#   :base_box_1 => ,
#   :base_box_2 => ,
#   :base_box_3 => ,
#   :base_box_4 => ,
#   :base_box_5 => ,
#   :base_box_6 => ,
#   :base_box_7 => ,
#   :base_box_8 => }

class Sudoku
  attr_reader :prepped_board
  def initialize(board_string)
    @size_of_side = Math.sqrt(board_string.length).to_i
    @board = board_string
    @prepped_board = []
  end

  def prep_board
    @size_of_base_box_side= Math.sqrt(@size_of_side).to_i
    @prepped_board  = @board.split("").each_slice(@size_of_side).to_a
    @prepped_board
  end

  def find_first_empty_cell
    @prepped_board.each_with_index do |row, row_idx|
      row.each_with_index do |number, col_idx|
        @coords= [row_idx, col_idx]
        return @coords if number == "-"
      end
    end
  end

  def check_row(coords)
    @known_numbers_row = @prepped_board[coords[0]]-["-"]
  end

  def check_col(coords)
    @known_numbers_col = @prepped_board.transpose[coords[1]]-["-"]
    @known_numbers_col
  end

  def check_which_base_box(coords)
     SIXTEENCELL.keys.each do |key|
        return key if SIXTEENCELL[key].include?(coords)
     end
  end

  def check_base_box(key)
    @all_vals_box = []
    @size_of_side.times {|x| @all_vals_box << @prepped_board[SIXTEENCELL[key][x][0]][SIXTEENCELL[key][x][1]]}
    @known_numbers_box = @all_vals_box - ["-"]
  end

  def all_knowns(coords)
    all_known_nums = check_row(coords) + check_col(coords) + check_base_box(check_which_base_box(coords))
  end

  def cell_result(knowns)
    SIXTEENCELL_KNOWNS - knowns
  end

  def substitute_answer(string, coord)
    row = coord[0]
    col = coord[1]
    @prepped_board[row][col] = string
    @made_change = true
  end

  def game_loop
    coords = find_first_empty_cell
    check_row(coords)
    check_col(coords)
    key = check_which_base_box(coords)
    check_base_box(key)
    knowns = all_knowns(coords)
    answer = cell_result(knowns)
    if answer.size == 1
      substitute_answer(answer.first, coords)
    end
  end


  def solve
    @made_change = true
    while (@prepped_board.flatten.include?("-") && @made_change == true)
      @made_change = false
      game_loop
    end
    @print_answer=@prepped_board.each do |line| p line
    end
  end

  def to_s
    #{}"#{@print_answer}"
  end
end

s = Sudoku.new("1-43-42141322314")

s.prep_board == [["1","-","4","3"],["-","4","2","1"],["4","1","3","2"],["2","3","1","4"]]
s.solve

# p s.game_loop
# p s.game_loop

# # p s.game_loop
# p s.prepped_board
# [["1","-","4","3"],
# ["-","4","2","1"],
# ["4","1","3","2"],
# ["2","3","1","4"]]


#p s.find_first_empty_cell == [0, 1]
# p s.check_row([0,1]) == ["1","4","3"]
#p s.check_col([0,1]) == ["4","1","3"]
# p s.check_which_base_box([0,0])
# p s.check_base_box(:base_box_0)
#p s.all_knowns([0,1])
#p s.cell_result(s.all_knowns([0,1]))
# p s.get_base_box_coords
#p s.check_base_box(0) == ["1","4"]
##Pseudocode
## Add @board = board_string
## def prep_board, where we turn string into data structure
## def find first empty cell, get coordinate of first cell with dash, starting at A[0,0][0,0]
#### def check related cells = call on 3 methods, grouping check row, check column, check box
## def check_row = return all known numbers in row as array
## def check_column = return all known numbers in col as array
## def check base_box = return all known numbers in base_box as array
## def all_possible_numbers => array of constants you check against, which is 1...9 (or size_of_side)
## def find_all_knowns => take rows, column, base_box, flatten together, and make uniq
## def find_unknown= > all possible numbers - all knowns
## def solve =>call all methods

## def fill_cell =
##     if find_unknown cell == 1, replace dash w/ num
##      else ()
## def traverse_board #recursive
## => game loop
##
