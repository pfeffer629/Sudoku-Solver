####Pseudocode####
=begin
 Creating Rows
 Split the string into an array of letters and dashes
 split new array into 9 sub-arrays of nine elements(rows)

 Create Columns (putting on hold)

 Create Quadrants (putting on hold)

 Create Cells
Each cell is key of a hash
each value in hash is an array == to [1..9]



=end



class Sudoku
  attr_reader :board_string, :board, :possible_values

  NUMBER_KEY = ("1".."9").to_a

  def initialize(board_string)
    @board = create_board(board_string)


  end

  def create_board(board_string)
    @board = board_string.split('')
    @board = @board.each_slice(9).to_a
  end

  def corresponding_sets_vals(row_index, column_index)
    row_vals_for(row_index) + column_vals_for(column_index) + quadrant_vals_for(row_index, column_index)
  end

  def solve
    while unsolved?
      @board.each_with_index do |row, row_index|
        row.each.each_with_index do|cell, column_index|
          if cell == '-'
            @possible_values = NUMBER_KEY - corresponding_sets_vals(row_index, column_index)
            if @possible_values.length == 1
              @board[row_index][column_index] = @possible_values[0]
            end
          end
        end
      end
    end
    return @board
    # if check_if_solve?
    #   puts "I'm in the recursion loop"
    #   self.solve
    # end
    # return @board
  end

  def unsolved?
    @board.flatten.include?('-')
  end

  def row_vals_for(row_index)
    # @board[row_index].delete("-")
    @vals_in_row = []
    @board[row_index].each do |cell|
      if ("1".."9").include?(cell)
        @vals_in_row << cell
      end
    end
    @vals_in_row
  end

  def column_vals_for(column_index)
    # what does transpose do?
    column = []
    @vals_in_column = []
    @board.each do |row|
      column << row[column_index]
    end
    column.each do |cell|
      if ("1".."9").include?(cell)
        @vals_in_column << cell
      end
    end
  end

  def quadrant_vals_for(row_index, column_index)
    quadrants = {top_left_quadrant: [@board[0][0..2],
                                    @board[1][0..2],
                                    @board[2][0..2]].flatten,
                top_middle_quadrant: [@board[0][3..5],
                                    @board[1][3..5],
                                    @board[2][3..5]].flatten,
                top_right_quadrant: [@board[0][6..8],
                                    @board[1][6..8],
                                    @board[2][6..8]].flatten,
                middle_left_quadrant: [@board[3][0..2],
                                      @board[4][0..2],
                                      @board[5][0..2]].flatten,
              middle_middle_quadrant: [@board[3][3..5],
                                      @board[4][3..5],
                                      @board[5][3..5]].flatten,
              middle_right_quadrant:  [@board[3][6..8],
                                      @board[4][6..8],
                                      @board[5][6..8]].flatten,
              bottom_left_quadrant:   [@board[6][0..2],
                                      @board[7][0..2],
                                      @board[8][0..2]].flatten,
              bottom_middle_quadrant: [@board[6][3..5],
                                      @board[7][3..5],
                                      @board[8][3..5]].flatten,
              bottom_right_quadrant: [@board[6][6..8],
                                      @board[7][6..8],
                                      @board[8][6..8]].flatten }
      if (0..2).include?(row_index) && (0..2).include?(column_index)
        quadrant_values = quadrants[:top_left_quadrant]

      elsif (0..2).include?(row_index) && (3..5).include?(column_index)
        quadrant_values = quadrants[:top_middle_quadrant]

      elsif (0..2).include?(row_index) && (6..8).include?(column_index)
        quadrant_values = quadrants[:top_right_quadrant]

      elsif (3..5).include?(row_index) && (0..2).include?(column_index)
        quadrant_values = quadrants[:middle_left_quadrant]

      elsif (3..5).include?(row_index) && (3..5).include?(column_index)
        quadrant_values = quadrants[:middle_middle_quadrant]

      elsif (3..5).include?(row_index) && (6..8).include?(column_index)
        quadrant_values = quadrants[:middle_right_quadrant]

      elsif (6..8).include?(row_index) && (0..2).include?(column_index)
        quadrant_values = quadrants[:bottom_left_quadrant]

      elsif (6..8).include?(row_index) && (3..5).include?(column_index)
        quadrant_values = quadrants[:bottom_middle_quadrant]

      elsif (6..8).include?(row_index) && (6..8).include?(column_index)
        quadrant_values = quadrants[:bottom_right_quadrant]
      end
      quadrant_values
    end



  # def board
  # end

  # Returns a nicely formatted string representing the current state of the board
  def to_s
  end
end

# test_board = Sudoku.new("---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---")

# test_board = Sudoku.new("4-5269781682571493197834562826195347374682915951743628519326874248957136763418259")
# row_index = 0
# column_index = 0
# p test_board.board
# # p test_board.row_vals_for(row_index)  # => 4-5269781.split('')
# # p test_board.column_vals_for(column_index) #>

# # test_board.solve #=> 3

#  # p test_board.board
#  p test_board.quadrant_vals_for(0,0)

 test_board2 = Sudoku.new("---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---")

p test_board2.board
 p test_board2.solve






# find next empty cell

# return a row of values for a row index




