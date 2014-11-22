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
    @flat_board = @board_array.flatten
  end

  def get_row(row_index)
    @board_array[row_index]
  end

  def get_col(col_index)
    @board_array.transpose[col_index]
  end

  def all_block_possibilities(row_index, col_index)
    case 
    when row_index < 3 && col_index < 3
      block_0 = @flat_board.values_at(0..2, 9..11, 18..20)
      block_0.delete("-")
      block_possibilities = REFERENCE_ARRAY - block_0
    when row_index < 3 && 3 <= col_index && col_index < 6
      block_1 = @flat_board.values_at(3..5, 12..14, 21..23)
      block_1.delete("-")
      block_possibilities = REFERENCE_ARRAY - block_1
    when row_index < 3 && 6 <= col_index && col_index < 9
      block_2 = @flat_board.values_at(6..8, 15..17, 24..26)
      block_2.delete("-")
      block_possibilities = REFERENCE_ARRAY - block_2
    when 3 <= row_index && row_index < 6 && col_index < 3
      block_3 = @flat_board.values_at(27..29, 36..38, 45..47)
      block_3.delete("-")
      block_possibilities = REFERENCE_ARRAY - block_3
    when 3 <= row_index && row_index < 6 && 3 <= col_index && col_index < 6
      block_4 = @flat_board.values_at(30..32, 39..41, 48..50)
      block_4.delete("-")
      block_possibilities = REFERENCE_ARRAY - block_4
    when 3 <= row_index && row_index < 6 && 6 <= col_index && col_index < 9
      block_5 = @flat_board.values_at(33..35, 42..44, 51..53)
      block_5.delete("-")
      block_possibilities = REFERENCE_ARRAY - block_5
    when 6 <= row_index && row_index < 9 && col_index < 3
      block_6 = @flat_board.values_at(54..56, 63..65, 72..74)
      block_6.delete("-")
      block_possibilities = REFERENCE_ARRAY - block_6
    when 6 <= row_index && row_index < 9 && 3 <= col_index && col_index < 6
      block_7 = @flat_board.values_at(57..59, 66..68, 75..77)
      block_7.delete("-")
      block_possibilities = REFERENCE_ARRAY - block_7
    when 6 <= row_index && row_index < 9 && 6 <= col_index && col_index < 9
      block_8 = @flat_board.values_at(60..62, 69..71, 78..80)
      block_8.delete("-")
      block_possibilities = REFERENCE_ARRAY - block_8
    end
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
    row_checker(row_index) & col_checker(col_index) & all_block_possibilities(row_index, col_index)
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
    while @board_array.flatten.include?("-")
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
    end
    @board_array.flatten.join("")
  end

  # Returns a nicely formatted string representing the current state of the board
  def to_s
    @board_array.flatten.join("")
  end
end


