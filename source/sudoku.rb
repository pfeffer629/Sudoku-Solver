class Sudoku
  attr_reader :board_arr, :check_arr
  def initialize(board_string)
    @board_arr = board_string.split("")
    @poss_arr = %w(1 2 3 4 5 6 7 8 9)
    split_arr_to_9_rows
  end

  def split_arr_to_9_rows
    @board_arr = @board_arr.each_slice(9).to_a
  end

  def solve
    @no_hits = 0
    until is_incomplete? == false
      find_blank
    end
  end

  def is_incomplete?
    return false if not @board_arr.flatten.include?("-")
  end

  def find_blank
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
          escape_if_complex
        end
      end
    end
  end

  def check_row
    @check_arr += @board_arr[@blank_pos[0]].select {|v| v =~ /[1-9]/}
  end

  def check_col
    @check_arr += @board_arr.transpose[@blank_pos[1]].select {|v| v =~ /[1-9]/}
  end

  def identify_the_4_remaining_in_box
    @box_pos = [@blank_pos[0]%3, @blank_pos[1]%3]
    @row_return = @blank_pos[0]/3 #1
    @col_return = @blank_pos[1]/3 #0
    @box_checks = []
    2.times do |r|
      2.times do |c|
       @box_checks << @board_arr[(@box_pos[0]+r+1)%3+@row_return*3][(@box_pos[1]+c+1)%3+@col_return*3]
      end
    end
  end

  def check_box
    identify_the_4_remaining_in_box
    @check_arr += @box_checks.select {|v| v =~ /[1-9]/}
  end

  def number_check
    @check_arr = @check_arr.uniq.sort
    if @check_arr.length == 8
      @no_hits = 0
      @missing_number = "X"
      9.times do |n|
        unless @check_arr.include?(@poss_arr[n])
          return @missing_number = @poss_arr[n].to_s
        end
      end
    else
      @no_hits += 1
      false
    end
  end

  def insert_number
    if number_check
      @board_arr[@blank_pos[0]][@blank_pos[1]] = @missing_number
    end
  end

  def escape_if_complex
    if @no_hits >= 81
      abort("This problem is too complex for this Sudoku solver")
    end
  end

  def board
    @board_arr.join("")
  end

  def to_s
    9.times do |r|
      p @board_arr[r].join(" ")
    end
  end
end


