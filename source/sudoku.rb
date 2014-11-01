require 'debugger'
=begin
 # Implement a Ruby Racer - 'running pattern - Generated display - '

Input: A string of numbers and empty spaces (dashes)
Output: A filled string with unique characters 1-9

 --> NOTE: Constant (NUMBER INDEX ) created that will be a 1-9 array that we can reuse throughout
 our class to compare

Definitions: Row, column, cell, box

# WHAT IS SETUP?
 I. Replace the dashes in the entered sudoku text
  a. board_string.gsub(/\D/){0}

  - CREATE 2D array

  II. find next empty cell


Define a method


  Define a method extract_values   --> Get working for rows first!
    I. Pull all the values that are not equal to 0.
    II. Create a new array to store them in  (?)

  Define a method comparison?
    I. Compare our original array to the constant array letters (1-9) (IE: uniq method?)
    II. Return a new array with uniq values

Define a row method that iterates through the first row (9 characters)
  I. Slice the first 9 characters
    a. slice method (9)
  II. Check for empty cells (0)
  III.

Define a column method

Define a box method

Define a solved? method



Define a to_s method

Define find_next_empty_cell
  I. Iterate through each sub array.
  II. If we find zero,
     a. Return coordinate.
     b. Store coordinate in data structure

=end




class Sudoku
  attr_reader :board

  def initialize(board_string)
    # @display_board = board_string.split(//).clone
    @extracted_values = []
    # @board = []
    @board = create_2d_board(convert_dashes_to_zeroes(board_string))
     # Split the string into separate arrays.
  end

# WORkS
  def convert_dashes_to_zeroes(board_string)
    board_string.gsub(/\D/){0}.split(//)
  end


# WORKS
  def create_2d_board(board_vals)
    board_vals.each_slice(9).to_a
  end


# WORKS - BUT IFFY
  def extract_row_values(row_num)
    # row = (number / 9) * 9 # sets initial row to 0
    # @extracted_values.select {|num| num != 0}   # Might have to call destructive
    @row_number_for_match_row = (@board[row_num])    # ADDED THIS WHICH MIGHT BREAK CODE
    match_row(@row_number_for_match_row)  # Row to match      # ADDED THIS WHICH MIGHT BREAK CODE
  end

# WORKS
  def extract_column_values(col_num)
     # p @board
     @board.map {|col| col[col_num]}
  end

# WORKS
  def extract_box_values # (box_num)
     @box_slice_values = []
     p @board_string.each_slice(3) {|slice| @box_slice_values << slice }
  end

  # def comparison?
  #   alpha_numeric_index = (1..9).to_a
  #   collated_values = @extracted_values + alpha_numeric_index   # Class variables - Might have to change later
  #   collated_values.uniq!
  # end

# DOES NOT WORK?
  def solve
    81.times do |number|
      next if @board_string[number].to_i != 0

      numbers_array = extracted_values(number)
    end
  end

# DOES NOT WORK YET
  def match_row(cell, row)
    alpha_numeric_index = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    p alpha_row_number = @board[row] + alpha_numeric_index      # CHANGED THIS LINE
    p alpha_row_number.uniq!
     p @unique_value = alpha_row_number.pop

     # index[solution_number]
     # add arrays then call unique then grab the one that's not zero (insert this in replace of 0)
     # insert_value_to_cell()
     p "This is the unique value: #{@unique_value}"
     insert_value_to_cell
  end

  def insert_value_to_cell
    # p @row_index.to_i
    # p @cell_index.to_i
    p @board[@row_index.to_i][@cell_index.to_i] = @unique_value
    p @board

  end

#WORKS
  def find_next_empty_cell #If this works, we then need to write a method to find the unique value and ultimtely insert that value into out board
     @board.each_with_index do |row, row_i| # Accessing the rows
          row.each_with_index do |cell, cell_i|
            if cell == "0"
            # extract_row_values(row_i)
              @cell_index = cell_i
              @row_index = row_i
          end
        end
      end
      match_row(@cell_index, @row_index)
  end


# Pull row out
# Find the empty cell spot
# Solve for that cell

  # def

  # end

# WORKS
  def board
    @board
  end

  # Returns a nicely formatted string representing the current state of the board
  def to_s
  end
end

# [["0", "0", "0", "2", "6", "0", "7", "0", "1"],
# ["6", "8", "0", "0", "7", "0", "0", "9", "0"],
# ["1", "9", "0", "0", "0", "4", "5", "0", "0"],
# ["8", "2", "0", "1", "0", "0", "0", "4", "0"],
# ["0", "0", "4", "6", "0", "2", "9", "0", "0"],
# ["0", "5", "0", "0", "0", "3", "0", "2", "8"],
# ["0", "0", "9", "3", "0", "0", "0", "7", "4"],
# ["0", "4", "0", "0", "5", "0", "0", "3", "6"],
# ["7", "0", "3", "0", "1", "8", "0", "0", "0"]]


# test_game = Sudoku.new("---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---")
# p test_game.board.first == ["0", "0", "0", "2", "6", "0", "7", "0", "1"]
# p test_game.board.last ==  ["7", "0", "3", "0", "1", "8", "0", "0", "0"]

# p test_game.extract_row_values(5) == ["0", "5", "0", "0", "0", "3", "0", "2", "8"]
# p test_game.extract_column_values(0) == ["0", "6", "1", "8", "0", "0", "0", "0", "7"]


test_game = Sudoku.new("4-5269781682571493197834562826195347374682915951743628519326874248957136763418259")

p test_game.find_next_empty_cell  # => sets coords for an empty cell

# p test_game.extract_row_values(5) # == ["0", "5", "0", "0", "0", "3", "0", "2", "8"]
# p test_game.extract_column_values(0) # == ["0", "6", "1", "8", "0", "0", "0", "0", "7"]

# test_game.extract_box_values
