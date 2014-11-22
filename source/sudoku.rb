class Sudoku
  def initialize(board_string)
    @board_string = board_string
    @board_arr = board_string.split("")
    @poss_arr = %w(1 2 3 4 5 6 7 8 9)
    split_arr
  end

  def split_arr
    @board_arr = @board_arr.each_slice(9).to_a
  end

  def solve
    until find_blank == false
      find_next
    end
  end

  def find_next
    find_blank
    check_row
    check_col
    number_check
    insert_number
  end

  def find_blank
    @blank_pos = []
    @board_arr.each_with_index do |row, row_ind|
      row.each_with_index do |value, col_ind|
        if value == "-"
          @blank_pos = [row_ind, col_ind]
          return @blank_pos
        end
      end
    end
    return false
  end

  def check_row
    @check_arr = []
    @row_arr = @board_arr[@blank_pos[0]].select {|v| v =~ /[1-9]/}
    @check_arr = @check_arr.concat(@row_arr)
    @check_arr.sort!
  end

  def check_col
    @trans_board = @board_arr.transpose
    @col_arr = @trans_board[@blank_pos[1]].select {|v| v =~ /[1-9]/}
    @check_arr = @check_arr.concat(@col_arr)
    @check_arr.uniq!.sort!
  end

  def check_box
    @box_pos = []
    @box_pos << @blank_pos[0]%3
    @box_pos << @blank_pos[1]%3
    @box_pos
  end

  def number_check
    @missing_number = ""
    9.times do |n|
      if not @check_arr.include?(@poss_arr[n-1])
        return @missing_number = n.to_s
      end
    end
  end

  def insert_number
    @board_arr[@blank_pos[0]][@blank_pos[1]] = @missing_number
  end

  def board
    @board_arr.join("")
  end

  # Returns a nicely formatted string representing the current state of the board
  def to_s
    9.times do |r|
      p @board_arr[r].join(" ")
    end
  end
end


