# SUDOCODE
# Input: String representing empty board with numbers and dashes
# Output: String representing completed board with numbers

# Steps

# 1. Prepare Board
#      A) Receive String
#      B) Create DataStructure for Board
#      C) Check for Empty Cells
#           (If No Empty Cells) Board is Solved
#           (If There Are Empty Cells) Continue Solving
# 2. Find Next Empty Cell
#      A)
# 3. Check Related Cells
#      A) Check Row Contents
#      B) Check Column Contents
#      B) Check Box Contents
# 4. Find Possible Values for Empty Cell
#      A) Use Checks Above
# 5. Only One Possible Value?
#      (If Yes) Enter It
#      (If No) GoTo #2 Find Next Empty Cell

class Sudoku
  def initialize(board_string)
    @board_string = board_string
    @cells_per_dimension = Math::sqrt(board_string.length).to_i
  end

  def solve!
    current_cell = 0
    until complete?
      if snapshot &&= @board_string
         raise "Unsolvable Board!"
      end
      for i in 0..1000
        current_cell = find_index_of_next_empty_cell_after(current_cell)
        possible_values_for_cell = get_possible_values_for_cell(current_cell)
        fill_in_empty_cell(current_cell, possible_values_for_cell.first) if possible_values_for_cell.size == 1
        break if complete?
      end
      snapshot = @board_string
    end
  end

  def populate_row_for_cell(cell)
    @board_string.slice(@cells_per_dimension * (cell / @cells_per_dimension), @cells_per_dimension)
  end

  def populate_column_for_cell(cell)
    populated_column = ""
    @board_string.each_char.with_index do |char, column_loop_index|
      populated_column << char if column_loop_index % @cells_per_dimension == cell % @cells_per_dimension
    end
    populated_column
  end

  def populate_box_for_cell(cell)
    populated_box = ''
    boxes_per_dimension = Math::sqrt(@cells_per_dimension).to_i
    box_row = cell / (boxes_per_dimension * @cells_per_dimension)
    box_column = (cell / boxes_per_dimension) % boxes_per_dimension
    top_left_cell_of_box = box_row * boxes_per_dimension * @cells_per_dimension + box_column * boxes_per_dimension
    boxes_per_dimension.times do |i|
      populated_box << @board_string.slice(top_left_cell_of_box + i * @cells_per_dimension, boxes_per_dimension)
    end
    populated_box
  end

  def get_possible_values_for_cell(cell)
    values = populate_row_for_cell(cell) + populate_column_for_cell(cell) + populate_box_for_cell(cell)
    all_values = values.split('')
    possible_values = (1..@cells_per_dimension).reject do |i|
      all_values.include?(i.to_s)
    end
  end

  def complete?
    ! @board_string.include? '-'
  end

  def find_index_of_next_empty_cell_after(current_cell=0)
    @board_string.index('-',current_cell + 1) || @board_string.index('-')
  end

  def fill_in_empty_cell(cell, value)
    @board_string[cell] = value.to_s
  end

  # Returns a nicely formatted string representing the current state of the board
  def to_s
    @board_string
  end
end


## Tests


def test(actual, expected, message)
  puts message
  puts actual == expected
  puts "Actual: #{actual}"
  puts "Expected: #{expected}"
  puts "-----------------------"
end
=begin

unsolved_one_missing = '4-5269781682571493197834562826195347374682915951743628519326874248957136763418259'
solved = '435269781682571493197834562826195347374682915951743628519326874248957136763418259'

sudoku = Sudoku.new(unsolved_one_missing)
test(sudoku.complete?, false, '#complete? should return false for an unsolved board')
test(sudoku.find_index_of_next_empty_cell_after, 1, '#find_index_of_next_empty_cell_after should return 1 for unsolved_one_missing')

sudoku.solve!
test(sudoku.complete?, true, '#complete? should return true for a solved board')
test(sudoku.to_s, solved, 'Solution should match expected for problem with one empty cell')

unsolved_two_missing = '4-5269781682-71493197834562826195347374682915951743628519326874248957136763418259'

sudoku = Sudoku.new(unsolved_two_missing)
test(sudoku.find_index_of_next_empty_cell_after(2), 12, '#find_index_of_next_empty_cell_after(2) should return 12 for unsolved_two_missing')
test(sudoku.find_index_of_next_empty_cell_after(12), 1, '#find_index_of_next_empty_cell_after(13) should return 2 for unsolved_two_missing')
test(sudoku.populate_row_for_cell(0), "4-5269781", '#populate_row_for_cell(0) should return "4-5269781"')
test(sudoku.populate_row_for_cell(10), "682-71493", '#populate_row_for_cell(10) should return "682-71493"')
test(sudoku.populate_column_for_cell(0), "461839527", '#populate_column_for_cell(0) should return "461839527"')
test(sudoku.populate_box_for_cell(72), "519248763", '#populate_box_for_cell(72) should return "519248763"')
test(sudoku.get_possible_values_for_cell(1), [3], '#get_possible_values_for_cell(1) should return "3"')

sudoku.solve!
test(sudoku.to_s, solved, 'Solution should match expected for problem with two empty cells')

unsolved_second_puzzle = '--5-3--819-285--6-6----4-5---74-283-34976---5--83--49-15--87--2-9----6---26-495-3'
solved = '475936281932851764681274359517492836349768125268315497153687942794523618826149573'
sudoku_2 = Sudoku.new(unsolved_second_puzzle)
sudoku_2.solve!
puts sudoku_2
test(sudoku_2.to_s, solved, 'Solution should match expected')
=end

unsolved_square_puzzle = '-34141-332-414-2'
solved = '2341412332141432'
sudoku_3 = Sudoku.new(unsolved_square_puzzle)
sudoku_3.solve!
test(sudoku_3.to_s, solved, 'Solution should match expected')

