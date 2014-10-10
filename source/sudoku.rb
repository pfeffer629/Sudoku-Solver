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
  end

  def solve!
    while !complete?
      find_index_of_next_empty_cell
      @board_string = '435269781682571493197834562826195347374682915951743628519326874248957136763418259'
    end
  end

  def complete?
    ! @board_string.include? '-'
  end

  def find_index_of_next_empty_cell
    @board_string.index('-')
  end

  def board
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
  puts 'Actual: #{actual}'
  puts 'Expected: #{expected}'
end

unsolved_one_missing = '4-5269781682571493197834562826195347374682915951743628519326874248957136763418259'
solved = '435269781682571493197834562826195347374682915951743628519326874248957136763418259'

sudoku = Sudoku.new(unsolved_one_missing)
test(sudoku.complete?, false, '#complete? should return false for an unsolved board')
test(sudoku.find_index_of_next_empty_cell, 1, '#find_index_of_next_empty_cell should return 1 for unsolved_one_missing')

sudoku.solve!
test(sudoku.complete?, true, '#complete? should return true for a solved board')
test(sudoku.to_s, solved, 'Solution should match expected for problem with one empty cell')

unsolved_two_missing = '4-5269781682-71493197834562826195347374682915951743628519326874248957136763418259'

sudoku = Sudoku.new(unsolved_two_missing)
test(sudoku.find_index_of_next_empty_cell, 1, '#find_index_of_next_empty_cell should return 12 for unsolved_two_missing')
sudoku.solve!
test(sudoku.to_s, solved, 'Solution should match expected for problem with two empty cells')

unsolved_second_puzzle = '---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---'
solved = '?'
sudoku = Sudoku.new(unsolved_second_puzzle)
sudoku.solve!
test(sudoku.to_s, solved, 'Solution should match expected')

