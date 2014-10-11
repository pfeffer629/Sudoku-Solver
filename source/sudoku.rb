class Sudoku
  def initialize(board_string)
    @board_string = board_string
    @board = @board_string.split('').each_slice(9).to_a
  end

  def solve
    while not_complete?
      @board.each_with_index do |row, row_index|
        row.each_with_index do |value, value_index|
          if value == "-"
            check_cell(row_index, value_index)
          end
        end
      end
    end
    puts "Solved!"
  end

  def not_complete?
    # print "checking"
    @board.each_with_index do |row, row_index|
      row.each_with_index do |value, value_index|
        return true if value == '-'
      end
    end
    false
  end

  def check_cell (row_index, value_index)
    @possibilities=(1..9).to_a

    @cell_row= get_row(row_index)
    @cell_col= get_col(value_index)
    @cell_box= get_box(row_index, value_index)

    if @cell_box == 1
      a = @board.map do |x|
        x[0..2]
      end
      box1 = []
      a.each_with_index {|x,i| box1<<x if i<3 }
      box1.flatten!
      box1.each do |value|
        if @possibilities.include? value.to_i
          @possibilities.delete(value.to_i)
        end
      end

    elsif @cell_box == 2
      a = @board.map do |x|
        x[3..5]
      end
      box2 = []
      a.each_with_index do |x,i|
        box2<<x if i<3
      end
      box2.flatten!
      box2.each do |value|
        # print "value: #{value}"
        if @possibilities.include? value.to_i
          @possibilities.delete(value.to_i)
        end
      end
    elsif @cell_box == 3
      a = @board.map do |x|
        x[6..8]
      end
      box3 = []
      a.each_with_index do |x,i|
        box3<<x if i<3
      end
      box3.flatten!
      box3.each do |value|
        if @possibilities.include? value.to_i
          @possibilities.delete(value.to_i)
        end
      end


    elsif @cell_box == 4
      a = @board.map do |x|
        x[0..2]
      end
      box4 = []
      a.each_with_index do
        |x,i| box4<<x if i>2 && i <6
      end
      box4.flatten!
      box4.each do |value|
        if @possibilities.include? value.to_i
          @possibilities.delete(value.to_i)
        end
      end
    elsif @cell_box == 5
      a = @board.map do |x|
        x[3..5]
      end
      box5 = []
      a.each_with_index {|x,i| box5<<x if i>2 && i <6}
      box5.flatten!
      box5.each do |value|
        if @possibilities.include? value.to_i
          @possibilities.delete(value.to_i)
        end
      end

    elsif @cell_box == 6
      a = @board.map do |x|
        x[6..8]
      end
      box6 = []
      a.each_with_index {|x,i| box6<<x if i>2 && i <6}
      box6.flatten!
      box6.each do |value|
        if @possibilities.include? value.to_i
          @possibilities.delete(value.to_i)
        end
      end
    elsif @cell_box == 7
      a = @board.map do |x|
        x[0..2]
      end
      box7 = []
      a.each_with_index {|x,i| box7<<x if i>5 && i<9 }
      box7.flatten!
      box7.each do |value|
        if @possibilities.include? value.to_i
          @possibilities.delete(value.to_i)
        end
      end
    elsif @cell_box == 8
      a = @board.map do |x|
        x[3..5]
      end
      box8 = []
      a.each_with_index {|x,i| box8<<x if i>5 && i<9}
      box8.flatten!
      box8.each do |value|
        if @possibilities.include? value.to_i
          @possibilities.delete(value.to_i)
        end
      end
    elsif @cell_box == 9
      a = @board.map do |x|
        x[6..8]
      end
      box9 = []
      a.each_with_index {|x,i| box9<<x if i>5 && i<9 }
      box9.flatten!
      box9.each do |value|
        if @possibilities.include? value.to_i
          @possibilities.delete(value.to_i)
        end
      end
    end

    @cell_row.each do |value|
        if @possibilities.include? value.to_i
          @possibilities.delete(value.to_i)
        end
     end

   @cell_col.each do |value|
      if @possibilities.include? value.to_i
        @possibilities.delete(value.to_i)
      end
   end

   if @possibilities.length == 1
    @board[row_index][value_index] = @possibilities[0]
  end

  end

  def get_row(row_number)
    @board[row_number]
  end

  def get_col(col_index)
    @board.transpose[col_index]
  end

  def get_box(row_index, value_index)
    if row_index == 0 || row_index == 1 ||row_index == 2
      if value_index == 0 ||value_index == 1 ||value_index == 2
        1
      elsif value_index == 3 ||value_index == 4 ||value_index == 5
        2
      elsif value_index == 6 ||value_index == 7 ||value_index == 8
        3
      end
    elsif row_index == 3 || row_index == 4 ||row_index == 5
      if value_index == 0 ||value_index == 1 ||value_index == 2
        4
      elsif value_index == 3 ||value_index == 4 ||value_index == 5
        5
      elsif value_index == 6 ||value_index == 7 ||value_index == 8
        6
      end
    elsif row_index == 6 || row_index == 7 ||row_index == 8
      if value_index == 0 ||value_index == 1 ||value_index == 2
        7
      elsif value_index == 3 ||value_index == 4 ||value_index == 5
        8
      elsif value_index == 6 ||value_index == 7 ||value_index == 8
        9
      end
    end
  end

  def board

  end

  # Returns a nicely formatted string representing the current state of the board
  def to_s
    @board.each do |row|
      print row
      puts
    end
  end
end

# board_s = "---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---"
# a = Sudoku.new(board_s)
