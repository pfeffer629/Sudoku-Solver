class Sudoku
  attr_reader :board_array

  REFERENCE_ARRAY = ['1','2','3','4','5','6','7','8','9']

  def initialize(board_string)
    @board_string = board_string
    board_maker
  end

  def board_maker
    # board = string.split("")
    @board_array = @board_string.split('').each_slice(9).to_a
  end

  def get_row(index)
    @board_array[index]
  end

  def get_col(index)
    @board_array.transpose[index]
  end

  def get_block

  end

  def row_checker(index)
    present_numbers = get_row(index).select{|cell_value| REFERENCE_ARRAY.include?(cell_value)}
    row_possibilities = REFERENCE_ARRAY - present_numbers
    return row_possibilities
  end

  def col_checker(index)
    present_numbers = get_col(index).select{|cell_value| REFERENCE_ARRAY.include?(cell_value)}
    col_possibilities = REFERENCE_ARRAY - present_numbers
    return col_possibilities
  end

  def all_row_possibilities
    row_possibilities = []
    @board_array.each_with_index do |row, index|
      row_possibilities << row_checker(index)
    end
    return row_possibilities
  end

  def all_col_possibilities
    col_possibilities = []
    @board_array.each_with_index do |col, index|
      col_possibilities << col_checker(index)
    end
    return col_possibilities
  end

  def all_possibilities(row_index, col_index)
    row_checker(row_index) & col_checker(col_index)
  end

  def block_checker

  end

  def pretty_board
    @board_array.each {|row| p row}
  end

  def cell_empty(row_index, col_index)
    @board_array[row_index][col_index] == "-"
  end

  def unique_solution?(row_index, col_index)
    all_possibilities(row_index, col_index).length == 1
  end

  def solve
    # while @board_array.flatten.include?("-")
      all_pos = []
      0.upto(8) do |row_index|
        0.upto(8) do |col_index|
          if cell_empty(row_index, col_index)
            if unique_solution?(row_index, col_index)
              @board_array[row_index][col_index] = all_possibilities(row_index, col_index)[0]
            end
            # all_pos << cell_checker(row_index, col_index)
          end
        end
      end
    # end
    p board_array
  end

  # Returns a nicely formatted string representing the current state of the board
  def to_s
    @board_array.flatten.join("")
  end
end

easy_board = Sudoku.new("4-5269781682571493197834562826195347374682915951743628519326874248957136763418259")
my_sudoku = Sudoku.new("--5-3--819-285--6-6----4-5---74-283-34976---5--83--49-15--87--2-9----6---26-495-3")
# p my_sudoku.all_row_possibilities
# p my_sudoku.all_col_possibilities

# p easy_board.cell_checker(0, 1) == ["3"]
# p my_sudoku.cell_checker(0, 1) == ["6","7"]
p my_sudoku.pretty_board
p my_sudoku.solve
p my_sudoku.pretty_board
p my_sudoku.solve
p my_sudoku.pretty_board
# # p my_sudoku.pretty_board
# p easy_board.solve

