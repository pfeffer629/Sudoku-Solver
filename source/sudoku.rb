class Sudoku
  attr_reader :board_arr, :check_arr
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
    until is_incomplete? == false
      find_blank
    end
  end

  def is_incomplete?
    return false if not @board_arr.flatten.include?("-")
  end

  def find_blank
    @blank_pos = []
    @board_arr.each_with_index do |row, row_ind|
      row.each_with_index do |value, col_ind|
        if value == "-"
          @blank_pos = [row_ind, col_ind]
          @check_arr = []
          check_row
          check_col
          check_box
          number_check
          insert_number
        end
      end
    end
  end

  def check_row
    @row_arr = @board_arr[@blank_pos[0]].select {|v| v =~ /[1-9]/}
    @check_arr = @check_arr.concat(@row_arr)
    @check_arr = @check_arr.uniq.sort
  end

  def check_col
    @trans_board = @board_arr.transpose
    @col_arr = @trans_board[@blank_pos[1]].select {|v| v =~ /[1-9]/}
    @check_arr = @check_arr.concat(@col_arr)
    @check_arr = @check_arr.uniq.sort
  end

  def check_box
    @box_pos = []
    @row_trans = @blank_pos[0]/3 #1
    @col_trans = @blank_pos[1]/3 #0
    @box_pos << @blank_pos[0]%3 #2
    @box_pos << @blank_pos[1]%3 #0
    @box_checks = []
    @box_checks << @board_arr[(@box_pos[0]+1)%3+@row_trans*3][(@box_pos[1]+1)%3+@col_trans*3]
    @box_checks << @board_arr[(@box_pos[0]+2)%3+@row_trans*3][(@box_pos[1]+1)%3+@col_trans*3]
    @box_checks << @board_arr[(@box_pos[0]+1)%3+@row_trans*3][(@box_pos[1]+2)%3+@col_trans*3]
    @box_checks << @board_arr[(@box_pos[0]+2)%3+@row_trans*3][(@box_pos[1]+2)%3+@col_trans*3]
    @box_checks
    @box_arr = @box_checks.select {|v| v =~ /[1-9]/}
    @check_arr = @check_arr.concat(@box_arr)
    @check_arr = @check_arr.uniq.sort
  end

  def number_check
    if @check_arr.length == 8
      @missing_number = "X"
      9.times do |n|
        if not @check_arr.include?(@poss_arr[n])
          return @missing_number = @poss_arr[n].to_s
        end
      end
    else
      false
    end
  end

  def insert_number
    if number_check
      @board_arr[@blank_pos[0]][@blank_pos[1]] = @missing_number
    end
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


