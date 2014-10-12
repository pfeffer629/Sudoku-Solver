class Sudoku

  attr_reader :board ,:coordinates

  box1 = [[0,0],[0,1],[0,2],[1,0],[1,1],[1,2],[2,0],[2,1],[2,2]]
  box2 = [[0,3],[0,4],[0,5],[1,3],[1,4],[1,5],[2,3],[2,4],[2,5]]
  box3 = [[0,6],[0,7],[0,8],[1,6],[1,7],[1,8],[2,6],[2,7],[2,8]]
  box4 = [[3,0],[3,1],[3,2],[4,0],[4,1],[4,2],[5,0],[5,1],[5,2]]
  box5 = [[3,3],[3,4],[3,5],[4,3],[4,4],[4,5],[5,3],[5,4],[5,5]]
  box6 = [[3,6],[3,7],[3,8],[4,6],[4,7],[4,8],[5,6],[5,7],[5,8]]
  box7 = [[6,0],[6,1],[6,2],[7,0],[7,1],[7,2],[8,0],[8,1],[8,2]]
  box8 = [[6,3],[6,4],[6,5],[7,3],[7,4],[7,5],[8,3],[8,4],[8,5]]
  box9 = [[6,6],[6,7],[6,8],[7,6],[7,7],[7,8],[8,6],[8,7],[8,8]]

  def initialize(board_string)
    @board_string = board_string
    row1_array = @board_string.slice(0..8).split("")
    row2_array = @board_string.slice(9..17).split("")
    row3_array = @board_string.slice(18..26).split("")
    row4_array = @board_string.slice(27..35).split("")
    row5_array = @board_string.slice(36..44).split("")
    row6_array = @board_string.slice(45..53).split("")
    row7_array = @board_string.slice(54..62).split("")
    row8_array = @board_string.slice(63..71).split("")
    row9_array = @board_string.slice(72..80).split("")
    @board = [row1_array,row2_array, row3_array, row4_array, row5_array, row6_array, row7_array, row8_array, row9_array]
    @coordinates=[]

  end

  def board_has_empties
    @board.flatten.include?("-")
  end
  #Check for empty cells.
  def solved?
    !board_has_empties
    # return true unless board_has_empties
    # return false
  end

  def next_empty_cell_index
    board.flatten.find_index{ |cell| cell == "-" }
  end

  def set_current_empty_cell_coords

    index = next_empty_cell_index
    coordinates << @current_row_index = index/9
    coordinates << @current_col_index = index%9
  end

  def get_column()
    column_results = []
    board.each.with_index do |row, row_index|
      column_results << board[row_index][coordinates[1]]
      print board[row_index][coordinates[1]]
      puts
    end
  end

  def get_row()
    row_results = []
    board.each.with_index do |column, column_index|
      row_results << board[coordinates[0]][column_index]
      print board[coordinates[0]][column_index]
      puts
    end
  end

  def get_current_box
    jkas;dlkfja;lskdfja;lskdfj# current_box = (@current_cell_index/27)*3 + (@current_cell_index%9)/3
    # @box_index_lookup[current_box].map { |index| @board[index] }
  end
    box_results = board[1..3].transpose[0..-7]
    board[1..3].transpose[0..-7]
  end


  def find_possible_numbers
    @column_results.gsub("-",nil)
    @row_results.gsub("-",nil)
    @missing_results=(1..9).to_a - @column_results.join().split("").map(&:to_i) - row_results.join().split("").map(&:to_i) - @box_results.join().split("").map(&:to_i)
  end

  def solve
    next_empty_cell_index
    my_coor=set_current_empty_cell_coords
    get_column(my_coor)
    get_row(my_coor)
    get_box
    find_possible_numbers
      if @missing_results == 1
        board[coordinates] << @missing_results
      end

    until solved?
      set_current_empty_cell_coords
      exit
      #
      #
      #
    end
  end

  # Returns a nicely formatted string representing the current state of the board
  def to_s
  end
end

# array.each.with_index do |row, row_index|
#         # row.each.with_index do |element, column_index|
#            print array[row_index][2]
#            puts
#    end
# end

# array.each.with_index do |cell, row_index|
#   if cell

# array.each_index do | element, row |
#  array[row].each_index do | cell, column |
#     p row
#    end
# end


# board.each.with_index do |column, column_index|
#       print board[0][column_index]
#       puts
#     end




