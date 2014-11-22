# Sudocode

# Input: String of integers and '-'s
#   - Dashes represent empty cells
# Output:
#   - Solved Board
#   - i.e. no more dashes.  all cells are populated with numbers
#
# 1. Find next empty cell
# 2. Find missing number
# => a. Find missing numbers in it's row. Store in an array 'missing_integers'.
# => b. Find missing numbers in its column. Store in an array 'missing_integers'
# => c. Find missing numbers in its box.  Store in array 'missing_integers'

# 3. Out of the missing_integers, find the number that appears 3 times.
# => a. If no number appears 3 times.  Skip this cell and go back to Step 1.
# => b. If there is a number appearing 3 times, insert that number in the empty cell.

# 4. Check if board is solved
# => a. If solved, return true
# => b. Else, go back to step 1.

class Sudoku
  def initialize(board_string)
    @board_string = board_string
    rows
    columns
  end

  def rows
    @row1 = @board_string[0...9]    #positions 0-9
    @row2 = @board_string[9...18]   #position 9-18
    @row3 = @board_string[18...27]
    @row4 = @board_string[27...36]
    @row5 = @board_string[36...45]
    @row6 = @board_string[45...56]
    @row7 = @board_string[56...63]
    @row8 = @board_string[63...72]
    @row9 = @board_string[72...81]
  end

  def columns
    inside_index = 0
    outside_index = 0
    all_columns = ""

    until outside_index == 9

      while inside_index<@board_string.length
        all_columns << @board_string[inside_index]
        inside_index +=9
      end

    outside_index += 1
    inside_index = outside_index
    end

    @col1 = all_columns[0...9]
    @col2 = all_columns[9...18]
    @col3 = all_columns[18...27]
    @col4 = all_columns[27...36]
    @col5 = all_columns[36...45]
    @col6 = all_columns[45...56]
    @col7 = all_columns[56...63]
    @col8 = all_columns[63...72]
    @col9 = all_columns[72...81]
  end


  # def main
  #   find_next_empty_cell
  #   check_row
  #   check_column
  #   check_box
  #   is_solved?
  # end

  def find_next_empty_cell
    @empty_cell_position = @board_string.index('-')
  end


  def check_row
    if @empty_cell_position == (0...9)
      missing_in_row = missing_integers(@row1)
    elsif @empty_cell_position == (9...18)
      missing_in_row = missing_integers(@row1)
    elsif @empty_cell_position == (18...27)
      missing_in_row = missing_integers(@row1)
    elsif @empty_cell_position == (27...36)
      missing_in_row = missing_integers(@row1)
    elsif @empty_cell_position == (36...45)
      missing_in_row = missing_integers(@row1)
    elsif @empty_cell_position == (45...56)
      missing_in_row = missing_integers(@row1)
    elsif @empty_cell_position == (56...63)
      missing_in_row = missing_integers(@row1)
    elsif @empty_cell_position == (63...72)
      missing_in_row = missing_integers(@row1)
    elsif @empty_cell_position == (72...81)
      missing_in_row = missing_integers(@row1)
    else "SOMETHING MESSED UP"
    end
      # return numbers 1-9 except numbers that appear in @row1
    # if position 0..9, check row1
    # if position 9..18, check row2..
  end

  def check_column
    @missing_in_column = missing_integers(@col1)
  end

  def check_box
    @missing_in_box = missing_integers(@box1)
  end

  def missing_integers(numbers_found)
    complete_row = %w[1 2 3 4 5 6 7 8 9]
    numbers_arr = numbers_found.split("")
    complete_row - numbers_arr
  end

  def solve
  end

  def board
  end

  # Returns a nicely formatted string representing the current state of the board
  def to_s
  end
end


game = Sudoku.new("---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---")
p game.rows
p game.columns
game.find_next_empty_cell

# p game.missing_integers("---26-7-1")
