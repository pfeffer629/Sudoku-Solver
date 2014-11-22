class Sudoku
  def initialize(board_string)
    @board = board_string.split(//).each_slice(9)
    @test_array = ['1','2','3','4','5','6','7','8','9']
    @boxes = [
      [[0,0],[0,1],[0,3],[1,0],[1,1],[1,2],[2,0],[2,1],[2,2]], #box_1
      [[0,3],[0,4],[0,5],[1,3],[1,4],[1,5],[2,3],[2,4],[2,5]], #box_2
      [[0,6],[0,7],[0,8],[1,6],[1,7],[1,8],[2,6],[2,7],[2,8]], #box_3
      [[3,0],[3,1],[3,3],[4,0],[4,1],[4,2],[5,0],[5,1],[5,2]], #box_4
      [[3,3],[3,4],[3,5],[4,3],[4,4],[4,5],[5,3],[5,4],[5,5]], #box_5
      [[3,6],[3,7],[3,8],[4,6],[4,7],[4,8],[5,6],[5,7],[5,8]], #box_6
      [[6,0],[6,1],[6,3],[7,0],[7,1],[7,2],[8,0],[8,1],[8,2]], #box_7
      [[6,3],[6,4],[6,5],[7,3],[7,4],[7,5],[8,3],[8,4],[8,5]], #box_8
      [[6,6],[6,7],[6,8],[7,6],[7,7],[7,8],[8,6],[8,7],[8,8]] #box_9
    ]
  end

# find values in row/column/box respectively

  def row(index, board)
    board[index]
  end

  def column(index, board)
    column = []
    board.each do |row|
      column << row[index]
    end
    column
  end

  def box(box)
    box_values = []
    y = 0
    x = 0
    @boxes[box].each do |coords|
      y = coords[0]
      x = coords[1]
      box_values << @board[y][x]
    end
    box_values
  end

#finds box given x and y coordinates
  def in_box(y, x)
    @boxes.each do |box|
      box.each_with_index do |coords, index|
        return index if coords == [y, x]
      end
    end
    false
  end

#checks for duplicates in row/column/box
  def valid_board?(board)
    9.times do |index|
      return false unless valid_column?(column(index, board))
      return false unless valid_row?(row(index, board))
      return false unless valid_box?(box(index, board))
    end
    true
  end

#do these work?
  def valid_row?(row)
    row.each do |cell|
      return false if !@test_array.one?{|sudoku_element| sudoku_element == cell}
    end
    true
  end
  # 8 numbers - returns true

  def valid_column?(column)
    column.each do |cell|
      next if cell == '-'
      return false if !@test_array.one?{|sudoku_element| sudoku_element == cell}
    end
    true
  end

  def valid_box?(box)
    row.each do |cell|
      return false if !@test_array.one?{|sudoku_element| sudoku_element == cell}
    end
    true
  end

  def possible(y_coord, x_coord)
    possible = []
    @test_array.each do |sudoku_element|
      possible << sudoku_element if test_number?(sudoku_element, y_coord, x_coord)
    end
    possible
  end

  def test_number?(string, y_coord, x_coord)
    test_board = @board.clone
    test_board[y_coord][x_coord] = string
    valid_board?(test_board)
  end

  def solve!
    while !solved? do
      @board.each_with_index do |row, y|
        row.each_with_index do |element, x|
          next unless element == '-'

        end
      end
    end
  end

  def solved?
    !@board.flatten.include?('-')
  end

  def board
  end

  # Returns a nicely formatted string representing the current state of the board
  def to_s
    @board.each do |row|
      row.each do |element|
        print element
      end
      print "\n"
    end
  end
end


