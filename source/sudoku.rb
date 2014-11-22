class Sudoku
  def initialize(board_string)
    @board_string = board_string
    @board = @board_string.split("")
    @numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
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

  # def solutions
  #   boxes
  #   rows
  #   columns
  #   index = 0
  #   while index <= 8
  #     possible_solutions = []
  #       @numbers.each do |number| unless @nested_rows[index].include?(number) || @columns[index].include?(number) || @nested_boxes[index].include?(number)
  #       possible_solutions << number
  #       end
  #     end
  #     index += 1
  #     p possible_solutions
  #   end
  # end

  def solutions

  end


  def solve

  end


  def board
    boxes
    rows
    columns
    @nested_rows.each {|row| p row}
    puts
    p @nested_rows[@board[1].index]
    p @columns[@board[1]]
  end
end



