class Sudoku
  attr_reader :board
  POSSIBLE_VALUES = (1..9).to_a
  def initialize(board_string)
    @board_string = board_string
    fill_board
  end

  def solve
    until each_cell_is_filled?
      go_through_each_cell do |row, col|
        next if there_is_something_at? row, col
        left_overs = get_possible_values row, col
        write_value(left_overs, row, col) if should_write_from?(left_overs)
      end
    end
  end

  private
  def fill_board
    @board = @board_string.split("")
    .each_slice(9)
    .map do |row|
      row.map do |string|
        string == '-' ? nil : string.to_i
      end
    end
  end

  def get_possible_values row, col
    POSSIBLE_VALUES - get_row(row) - get_col(col) - get_box(row, col)
  end

  def write_value array row, col
    @board[row][col] = array.first
  end

  def should_write_from? left_overs
    left_overs.length == 1
  end

  def there_is_something_at? row, col
    !!@board[row][col]
  end

  def each_cell_is_filled?
    @board.each do |row|
      row.each do |cell|
        return false if cell.nil?
      end
    end
    true
  end

  def get_row(row)
    @board[row]
  end

  def get_col(col)
    @board.transpose[col]
  end

  def get_box(row, col)
    generate_boxes[(row / 3) * 3 + (col / 3)]
  end

  def generate_boxes
    [
      @board[0][0..2] + @board[1][0..2] + @board[2][0..2],
      @board[0][3..5] + @board[1][3..5] + @board[2][3..5],
      @board[0][6..8] + @board[1][6..8] + @board[2][6..8],
      @board[3][0..2] + @board[4][0..2] + @board[5][0..2],
      @board[3][3..5] + @board[4][3..5] + @board[5][3..5],
      @board[3][6..8] + @board[4][6..8] + @board[5][6..8],
      @board[6][0..2] + @board[7][0..2] + @board[8][0..2],
      @board[6][3..5] + @board[7][3..5] + @board[8][3..5],
      @board[6][6..8] + @board[7][6..8] + @board[8][6..8]
    ]
  end

  def go_through_each_cell
    @board.each_index do |row|
      @board[row].each_index do |col|
        yield row, col
      end
    end
  end

  # Returns a nicely formatted string representing the current state of the board
  def to_s
    @board.map {|row| row.map {|val| val.nil? ? '-' : val}.join(' | ')}.join("\n")
  end
end

sudocode = Sudoku.new("---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---")
sudocode.solve
puts sudocode
