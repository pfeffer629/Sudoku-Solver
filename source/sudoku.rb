class Sudoku
  attr_reader :board
  VALUES = (1..9).to_a
  def initialize(board_string)
    @board_string = board_string
    fill_board
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


  def solve
    board_filled?
    possible = []
    # replace_empty_cells
    possible = VALUES - check_row(0)
    possible
  end

  def board_filled?
    @board.each { |row| row.each { |cell| return false if cell.nil?  } }
    true
  end

  def find_empty_cell
    # p @board
    # @board.each do |row|
    #   # puts "inside row"
    #   row.map! do |cell|
    #     # puts "inside cell"
    #     if cell == "- " || cell == "-"
    #       ((1..9).to_a)
    #     elsif cell.is_a? String
    #         cell.ljust(1).to_i
    #     else
    #       cell
    #     end
    #   end
    # end
    # @board

  end
  def check_row row
    # eliminate = []
    # array_indices = []

    ints = []
    get_row(row).each do |cell|
      if cell.is_a? Integer
        ints << cell
      end
    end
    ints
    # iterates through each row of the @board
    # @board.each do |row|
    #   # iterates through each cell in the row
    #   row.each_with_index do |cell, index|
    #     # if the cell is an array
    #     if cell.is_a? Array
    #       # push the index of the cell to the array_indices
    #       array_indices << index
    #       p array_indices
    #       # else if cell is an integer
    #     elsif cell.is_a? Integer
    #       # loop through our array_indices and
    #       # delete each integer value in the row[index from array_indices]
    #       # row[array_index].delete(cell)
    #       array_indices.each do |array_index|
    #         p row[array_index]
    #       end
    #     end
    #   end
    # end
  end

  # def board
  # end

  # Returns a nicely formatted string representing the current state of the board
  def to_s
  # formatted_board = @board.map do |row|
  #                      row.map! {|char| "-" if char.nil? }
  #                     row.join
  #                   end
  # puts formatted_board
  #   ""
  # end
end


### Driver Test Code #######
board1 = Sudoku.new("---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---")
# puts board1
# board1.replace_empty_cells
puts '-' * 20
board2 = Sudoku.new("4-5269781682571493197834562826195347374682915951743628519326874248957136763418259")
p board2
p board2.solve
p board2.board_filled? == false
p board2.get_row(0) == [4, nil, 5, 2, 6, 9, 7, 8, 1]
p board2.get_col(0) == [4, 6, 1, 8, 3, 9, 5, 2, 7]
p board2.check_row(0) == [4, 5, 2, 6, 9, 7, 8, 1]
# p board2.fill_board
# board2.replace_empty_cells
# p board2.board
p board2.get_quadrant(0, 0)
puts board2
