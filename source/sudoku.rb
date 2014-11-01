class Sudoku
  attr_reader :board
  VALUES = (1..9).to_a
  def initialize(board_string)
    @board_string = board_string
    fill_board
  end

  def solve
    possible = []
    unless board_filled?
      @board.each_with_index do |row, row_index|
        row.each_with_index do |cell, col_index|
          if find_empty_cell == [row_index, col_index]
            possible = VALUES - (check_row(row_index) + check_col(col_index) + check_quadrant(row_index,col_index) )
            if possible.length == 1
              @board[row_index][col_index] = possible[0]
            end
          end
        end
      end
    end
    @board
  end

  def fill_board
    @board = @board_string.split("").each_slice(9).to_a
    @board.map { |row| row.map! { |cell| cell == "-" ? nil : cell.to_i }}
    p @board
  end

  def get_row(row)
    return @board[row]
  end

  def get_col(col)
    transposed_board = @board.transpose
    return transposed_board[col]
  end

  def get_quadrant row, col
    quandrants = [@board[0][0..2] + @board[1][0..2] + @board[2][0..2],
                  @board[0][3..5] + @board[1][3..5] + @board[2][3..5],
                  @board[0][6..8] + @board[1][6..8] + @board[2][6..8],
                  @board[3][0..2] + @board[4][0..2] + @board[5][0..2],
                  @board[3][3..5] + @board[4][3..5] + @board[5][3..5],
                  @board[3][6..8] + @board[4][6..8] + @board[5][6..8],
                  @board[6][0..2] + @board[7][0..2] + @board[8][0..2],
                  @board[6][3..5] + @board[7][3..5] + @board[8][3..5],
                  @board[6][6..8] + @board[7][6..8] + @board[8][6..8]]
    quandrants[(row / 3) * 3 + (col / 3)]
  end

  def board_filled?
    @board.each { |row| row.each { |cell| return false if cell.nil?  } }
    true
  end

  def find_empty_cell
    @board.each_with_index do |row, row_i|
      row.each_with_index do |cell, col_i|
        return [row_i, col_i] if cell.nil?
      end
    end
  end

  def check_row row
    ints = []
    get_row(row).each do |cell|
      if cell.is_a? Integer
        ints << cell
      end
    end
    ints
  end

  def check_col col
    ints = []
    get_col(col).each do |cell|
      if cell.is_a? Integer
        ints << cell
      end
    end
    ints
  end

  def check_quadrant(col, row)
    ints = []
    get_quadrant(row, col).each do |cell|
      if cell.is_a? Integer
        ints << cell
      end
    end
    ints
  end

  # def board
  # end

  # Returns a nicely formatted string representing the current state of the board
  def to_s
  # formatted_board = @board.map do |row|
  #                      row.map! {|char| "-" if char.nil? }
  #                       row.join
  #                   end
  # puts formatted_board
  #   ""
  end
end


### Driver Test Code #######
board1 = Sudoku.new("---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---")

# p board1.solve
# p board1.board_filled?
# # p board1.get_row(0)
# # p board1.get_col(0)
# # p board1.check_row(0)
# # p board1.check_col(1)
# # p board1.check_quadrant(0,1)
# # p board1.get_quadrant(0, 0)
# p board1.find_empty_cell
# p board1.solve
puts '-' * 10
board2 = Sudoku.new("4-5269781682571493197834562826195347374682915951743628519326874248957136763418259")
# p board2

p board2.board_filled? == false
p board2.get_row(0) == [4, nil, 5, 2, 6, 9, 7, 8, 1]
p board2.get_col(0) == [4, 6, 1, 8, 3, 9, 5, 2, 7]
p board2.check_row(0) == [4, 5, 2, 6, 9, 7, 8, 1]
p board2.check_col(1) == [8, 9, 2, 7, 5, 1, 4, 6]
p board2.check_quadrant(0,1) == [4, 5, 6, 8, 2, 1, 9, 7]
p board2.get_quadrant(0, 0) == [4, nil, 5, 6, 8, 2, 1, 9, 7]
p board2.find_empty_cell == [0,1]
p board2.solve
# puts board2
