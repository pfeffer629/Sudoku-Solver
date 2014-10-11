class Sudoku
  def initialize(board_string)
    @board_string = board_string
    #sets board_string as instance variable
  end

  def board
    #Converts @board_string to array of rows, saved as instance variable, @board
    p @board = @board_string.split('').each_slice(9).to_a
  end

  def solve
    if solved?
      return @board
    else
      check_each_cell
      # run all methods to output board -- check_each_cell
    end
  end

  def solved?
    return false if @board.flatten.include?("-")
    true
  end

  def cell_empty?(empty_v)
    true if empty_v == "-"
  end

  # def store_empty_positions
  #   @cell_positions = []
  #   @board.each_with_index do | row, row_i |
  #     row.each_with_index do |cell_value, col_i |
  #       if cell_empty?(cell_value)
  #         @cell_positions << [row_i, col_i]
  #       end
  #     end
  #   end
  #   p @cell_positions
  # end

  def check_each_cell
    @cell_position = []
    @board.each_with_index do |row, row_i|
      row.each_with_index do |cell_value, col_i|
        if cell_empty?(cell_value)
          p "*" * 50
          @cell_position = [row_i,col_i]
          true_possible_nums = list_possible_nums(@cell_position)
          fill_cell if true_possible_nums.length == 1
        end
      end
    end
  end

  def list_possible_nums(cell_coord)
    p "in list_possible_nums"
    @possible_nums = ("1".."9").to_a
    check_row(cell_coord)
    check_col(cell_coord)
    check_box(cell_coord)
    @possible_nums
  end

  def check_row(cell_coord)
    p "in check_row"
    row_i = cell_coord[0]
    row_nums = @board[row_i]
    not_possible_nums = row_nums.reject {|num| num == "-" }
    p "ROW NUMS"
    p @possible_nums -= not_possible_nums

    #find_possible_row_col_or_box(row_i)
  end

  def check_col(cell_coord)
    p "in check_col"
    col_i = cell_coord[1]
    p @board
    p transposed = @board.transpose
    p @board
    p col_nums = transposed[col_i]
    p "NPV - PV"
    p not_possible_nums = col_nums.reject {|num| num == "-" }
    p @possible_nums -= not_possible_nums
    # find NPV for col
    # find_possible_row_col_or_box(col_I)
  end

  def check_box(cell_coord)
    p "in check_box"
    x = cell_coord[0] / 3
    y = cell_coord[1] / 3



    # loop through box?
    # find NPV for box
    # find_possible_row_col_or_box
  end

  def find_possible_row_col_or_box(coord)
    p "find_possible_row_col_or_box"
  end

  def fill_cell
    p "fill_cell"
    # board[@cell_coord] = @possible_nums[0] if @possible_nums.length == 1
  end


  # Returns a nicely formatted string representing the current state of the board
  def to_s

  end
end
