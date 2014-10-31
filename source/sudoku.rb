class Sudoku
  def initialize(board_string)
    @board_string = board_string
    @board = []
    convert_board_string
  end

  def convert_board_string
    @board_string.split('').each_slice(9) {|row| @board << row }
  end

  def solved?
    board.each { |row| row.each { |cell| return false if cell == "-" } }
    true
  end

  def find_empty_cell
    board.each_index do |row_i|
      board[row_i].each_index do |col_i|
        return [row_i, col_i] if board[row_i][col_i] == '-'
      end
    end
  end

  def row_values row
    board[row]
  end

  def col_values col
    board.map { |row| row[col] }
  end

  def quad_values quadrant
    values = []
    board.each_index do |row_i|
      board[row_i].each_index do |col_i|
        values <<  board[row_i][col_i] if get_cell_quadrant(row_i, col_i) == quadrant
      end
    end
    values
  end

  def get_cell_quadrant *cell_coords
    (cell_coords.last / 3 + 1 ) * (cell_coords.first / 3 + 1)
  end

  def get_cell_candidates

  end

  def solve
  end

  def board
    @board
  end

  # Returns a nicely formatted string representing the current state of the board
  def to_s
  end
end

=begin
DESCRIBE THE NOUNS AND VERBS

  INPUT: string of 81 chars (numbers and dashes)
  OUTPUT: string of 81 chars (all numbers)

  INSTANCE VARS:
    - @board
    - @related_cell_values = []
    -

  CONVERT INPUT DATA INTO STRUCTURE
    method: convert_board_string


  if solved?
    return solved board
  else
    1 - Find first empty
      method: find_empty_cell
        - loop through rows
            - loop through columns
              - if empty?
                  return cell coords
                  and go to #2

    2- Check related cells
      1 - collect all values from cell's row
        - method: row_values
        - input: row #
        - output: array of values
          - select row based on row coord of cell
          - and append array of values to @related_cell_values
      2 - collect all values from cell's column
        - method: column_values
        - input: column #
        - output: array of values
          - select column based on column coord of cell
          - and append array of values to @related_cell_values
      3 - collect all values from cell's sub quadrant
        - method: quadrant_values
        - input: quadrant #
        - output: array of values
          - select quadrant based on box of cell
          - and append array of values to @related_cell_values

    3 - Collate and Prune related values
      - method: get_related_values
        - input: cell coords
        - output: array of values
          call row_values + column_values + quadrant_values
      - method: unique_related_values
        - return @related_cell_values unique

    4 - Check unique
    5 - Enter value if unique or go to #1

=end
sudoku_board = Sudoku.new("123456789")
# sudoku_board.convert_board_string
p sudoku_board.board == [["1","2","3","4","5","6","7","8","9"]]
p sudoku_board.row_values(0) == ["1","2","3","4","5","6","7","8","9"]
p sudoku_board.col_values(0) == ["1"]
p sudoku_board.solved? == true

unsolved_sudoku_board = Sudoku.new("123456--9")
# unsolved_sudoku_board.convert_board_string
p unsolved_sudoku_board.solved? == false
p unsolved_sudoku_board.find_empty_cell == [0,6]
p unsolved_sudoku_board.get_cell_quadrant(0,0) == 1
p unsolved_sudoku_board.get_cell_quadrant(0,3) == 2
p unsolved_sudoku_board.get_cell_quadrant(0,8) == 3
p unsolved_sudoku_board.get_cell_quadrant(0,7) == 3
p unsolved_sudoku_board.quad_values(3) == ['-','-','9']


