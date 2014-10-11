# Sudocode
# Input: Board with string of numbers and dashes
# Output: string of numbers (solved board)

# 1. Prepare board by making a nested array "board" from the input string
# 2. Check if there are more empty cells (if there are no _ in the board)
# 3. Find the next cell with a _ by iterating through the board and if
# the cell is _ return the coordinates and save them as [cell_row][cell_column]
# 4. Check related cells
# A: Get the row (board[cell_row])
# B: Get the column
# C: Get the box
# 4 Calculate remaining numbers
# 5. Process remaining numbers
# 6. Loop


class Sudoku
  def initialize(board_string)
    @board_string = board_string
    @board = Array.new(9) {["1","-", "3", "4","5","6","7","8","9"]}
   # @board = @board_string.split(//).each_slice(9).to_a
  end

  def empty_cells?
    found_empty_cell = false
    @board.each_with_index do |row, row_index|
      row.each_with_index do | cell, col_index|
        if @board[row_index][col_index] == "-"
          found_empty_cell = true
        end
      end
    end
    return found_empty_cell
  end

  def find_next_empty_cell
    empty_cell_coords = []
    @board.each_with_index do |row, row_index|
      row.each_with_index do | cell, col_index|
        if @board[row_index][col_index] == "-"
          empty_cell_coords << row_index
          empty_cell_coords << col_index
          return empty_cell_coords
        end
      end
    end
    empty_cell_coords
  end


  def get_row(cell_coords)
    @board[cell_coords[0]]
  end

  def get_col(cell_coords)
    column = []
    @board.each_with_index do |row, row_index|
      row.each_with_index do |cell, col_index|
        if col_index == cell_coords[1]
          column << @board[row_index][col_index]
        end
      end
    end
    return column
  end

  def get_box(cell_coords)
    puts "you need to write get box, silly!"
    return []
  end

  def calc_remaining_nums(row_array, col_array)
    puts "row_array is: "
    p row_array
    puts "col_array is:"
    p col_array
    compare_array = ["1", "2", "3", "4","5","6","7","8","9"]
    row_array.each do |used_number|
      if compare_array.include?(used_number)
        compare_array.delete(used_number)
      end
    end

    col_array.each do |used_number|
      if compare_array.include?(used_number)
        compare_array.delete(used_number)
      end
    end
    return compare_array
    p "compare_array at end is: "
    p compare_array
  end


  def process_remaining_num(remaining_numbers, cell_coords)
    if remaining_numbers.length == 1
      @board[cell_coords[0]][cell_coords[1]] = remaining_numbers[0]
    end
    p @board.to_s
  end

  def solve

  end

  # def board
  # end

  # Returns a nicely formatted string representing the current state of the board
  def to_s
    @board.each do |row|
      p row
      end
  end
end

