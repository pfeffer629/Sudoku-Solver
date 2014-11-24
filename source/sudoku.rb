
 class Sudoku
  def initialize(board_string)
    @board_string = board_string
    @board = @board_string.split("")
    @numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
  end

  def coordinates
    @coordinates_hash = {
      0=> [0,0,0],
      1=> [0,1,0],
      2=> [0,2,0],
      3=> [0,3,1],
      4=> [0,4,1],
      5=> [0,5,1],
      6=> [0,6,2],
      7=> [0,7,2],
      8=> [0,8,2],
      9=> [1,0,0],
      10=> [1,1,0],
      11=> [1,2,0],
      12=> [1,3,1],
      13=> [1,4,1],
      14=> [1,5,1],
      15=> [1,6,2],
      16=> [1,7,2],
      17=> [1,8,2],
      18=> [2,0,0],
      19=> [2,1,0],
      20=> [2,2,0],
      21=> [2,3,1],
      22=> [2,4,1],
      23=> [2,5,1],
      24=> [2,6,2],
      25=> [2,7,2],
      26=> [2,8,2],
      27=> [3,0,3],
      28=> [3,1,3],
      29=> [3,2,3],
      30=> [3,3,4],
      31=> [3,4,4],
      32=> [3,5,4],
      33=> [3,6,5],
      34=> [3,7,5],
      35=> [3,8,5],
      36=> [4,0,3],
      37=> [4,1,3],
      38=> [4,2,3],
      39=> [4,3,4],
      40=> [4,4,4],
      41=> [4,5,4],
      42=> [4,6,5],
      43=> [4,7,5],
      44=> [4,8,5],
      45=> [5,0,3],
      46=> [5,1,3],
      47=> [5,2,3],
      48=> [5,3,4],
      49=> [5,4,4],
      50=> [5,5,4],
      51=> [5,6,5],
      52=> [5,7,5],
      53=> [5,8,5],
      54=> [6,0,6],
      55=> [6,1,6],
      56=> [6,2,6],
      57=> [6,3,7],
      58=> [6,4,7],
      59=> [6,5,7],
      60=> [6,6,8],
      61=> [6,7,8],
      62=> [6,8,8],
      63=> [7,0,6],
      64=> [7,1,6],
      65=> [7,2,6],
      66=> [7,3,7],
      67=> [7,4,7],
      68=> [7,5,7],
      69=> [7,6,8],
      70=> [7,7,8],
      71=> [7,8,8],
      72=> [8,0,6],
      73=> [8,1,6],
      74=> [8,2,6],
      75=> [8,3,7],
      76=> [8,4,7],
      77=> [8,5,7],
      78=> [8,6,8],
      79=> [8,7,8],
      80=> [8,8,8]
    }
  end

  def rows
    @row_1 = @board[0..8]
    @row_2 = @board[9..17]
    @row_3 = @board[18..26]
    @row_4 = @board[27..35]
    @row_5 = @board[36..44]
    @row_6 = @board[45..53]
    @row_7 = @board[54..62]
    @row_8 = @board[63..71]
    @row_9 = @board[72..80]
    @nested_rows = [@row_1, @row_2,
      @row_3, @row_4, @row_5, @row_6, @row_7, @row_8, @row_9]
  end

  def columns
    @columns = @nested_rows.transpose.to_a
  end

  def boxes
    @box_1 = @board[0..2] + @board[9..11] + @board[18..20]
    @box_2 = @board[3..5] + @board[12..14] + @board[21..23]
    @box_3 = @board[6..8] + @board[15..17] + @board[24..26]
    @box_4 = @board[27..29] + @board[36..38] + @board[45..47]
    @box_5 = @board[30..32] + @board[39..41] + @board[48..50]
    @box_6 = @board[33..35]+ @board[42..44] + @board[51..53]
    @box_7 = @board[54..56]+ @board[63..65]+ @board[72..74]
    @box_8 = @board[57..59]+ @board[66..68]+ @board[75..77]
    @box_9 = @board[60..62] + @board[69..71] + @board[78..80]
    @nested_boxes = [@box_1, @box_2, @box_3, @box_4, @box_5,
      @box_6, @box_7, @box_8, @box_9]
  end

  def solutions
    coordinates
    rows
    columns
    boxes
    possible_solutions = []
        # for each_index of @board, check if include?(any index of @number) if not, compare coordinates_hash key that == index to see if @nested_rows[value0] || @columns[value1] || @nested_boxes[value2] include?(any index of @number), numbers that are not included push to possible_solutions
  end


  def solve
  end


  def board
    rows
    @nested_rows.each {|row| p row}
  end
end