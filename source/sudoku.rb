class Sudoku

  attr_reader :board ,:coordinates

  box1 = [[0,0],[0,1],[0,2],[1,0],[1,1],[1,2],[2,0],[2,1],[2,2]]
  box2 = [[0,3],[0,4],[0,5],[1,3],[1,4],[1,5],[2,3],[2,4],[2,5]]
  box3 = [[0,0],[0,1],[0,2],[1,0],[1,1],[1,2],[2,0],[2,1],[2,2]]
  box4 = [[3,0],[3,1],[3,2],[1,0],[1,1],[1,2],[2,0],[2,1],[2,2]]
  box2 = [[0,3],[0,4],[0,5],[1,3],[1,4],[1,5],[2,3],[2,4],[2,5]]
  box3 = [[0,0],[0,1],[0,2],[1,0],[1,1],[1,2],[2,0],[2,1],[2,2]]
   box1 = [[0,0],[0,1],[0,2],[1,0],[1,1],[1,2],[2,0],[2,1],[2,2]]
  box2 = [[0,3],[0,4],[0,5],[1,3],[1,4],[1,5],[2,3],[2,4],[2,5]]
  box3 = [[0,0],[0,1],[0,2],[1,0],[1,1],[1,2],[2,0],[2,1],[2,2]]

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
    board.flatten.find_index{|cell| cell == "-"}
  end

  def set_current_empty_cell_coords

    index = next_empty_cell_index
    coordinates << @current_row_index = index/9
    coordinates << @current_col_index = index%9

    # @coordinates = [@current_row_index,@current_col_index]
  end

  def get_column()
    column_results = []
    board.each.with_index do |row, row_index|
      # row.each.with_index do |element, column_index|

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

  def get_box
    board[1..3].transpose[0..-7]
  end

  def solve
    next_empty_cell_index
    my_coor=set_current_empty_cell_coords
    get_column(my_coor)
    get_row(my_coor)
    get_box
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




