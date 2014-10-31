
=begin
 # Implement a Ruby Racer - 'running pattern - Generated display - '

Input: A string of numbers and empty spaces (dashes)
Output: A filled string with unique characters 1-9

 --> NOTE: Constant (NUMBER INDEX ) created that will be a 1-9 array that we can reuse throughout
 our class to compare

Definitions: Row, column, cell, box

Define a method
 I. Replace the dashes in the entered sudoku text
  a. board_string.gsub(/\D/){0}

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


---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---

=end




class Sudoku
  def initialize(board_string)
    @board_string = board_string.gsub(/\D/){0}split(//)
    @display_board = board_string.split(//).clone
    @extracted_values = []
     # Split the string into separate arrays.
  end

  def extract_values(number)

    array[9][9]

    row = (number / 9) * 9 # sets initial row to 0
    column = row % 9 #
  end

  def extract_row_values
    @extracted_values = @board_string.slice(9)
    @extracted_values.select {|num| num != 0}   # Might have to call destructive
  end

  def extract_column_values
    @column = []
    @column << @extracted_values
    p @column

  end

  def extract_box_values

  end

  def comparison?
    alpha_numeric_index = (1..9).to_a
    collated_values = @extracted_values + alpha_numeric_index   # Class variables - Might have to change later
    collated_values.uniq!
  end

  def solve
    81.times do |number|
      next if @board_string[number].to_i != 0

      numbers_array = extracted_values(number)
    end
  end

  def board
  end

  # Returns a nicely formatted string representing the current state of the board
  def to_s
  end
end


