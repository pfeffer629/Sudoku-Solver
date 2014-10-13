class Sudoku
  def initialize(board_string)
    @board_string = board_string
    @board = @board_string.split('').each_slice(9).to_a
  end

  def solve
    @solved = false
    while @solved == false
      fill_cells_if_possible
      solved?
    end
    @board
  end

  def to_s
    p "-" * 25
      @board.each_with_index do |row, row_i|
        row_string = "| "
        p "-" * 25 if row_i == 3 || row_i == 6
        row.each_with_index do |cell, col_i|
          if col_i == 3 || col_i == 6
            row_string << "| " + cell + " "
          elsif col_i == 8
            row_string << cell
          else
            row_string << cell + " "
          end
        end
        row_string << " |"
        p row_string
      end
    p "-" * 25
  end

  private
  def solved?
    if @board.flatten.include?("-")
      @solved = false
    else
      @solved = true
    end
  end

  def cell_empty?(digit)
    true if digit == "-"
  end

  def fill_cells_if_possible
    @board.each_with_index do |row, row_i|
      row.each_with_index do |cell_value, col_i|
        if cell_empty?(cell_value)
          fill_cell([row_i,col_i]) if find_possible_nums([row_i,col_i]).length == 1
        end
      end
    end
  end

  def find_possible_nums(cell_coord)
    @possible_nums = ("1".."9").to_a
    @possible_nums -= check_row(cell_coord)
    @possible_nums -= check_col(cell_coord)
    @possible_nums -= check_box(cell_coord)
  end

  def check_row(cell_coord)
    row_index = cell_coord[0]
    @board[row_index].reject {|num| num == "-" }
  end

  def check_col(cell_coord)
    columns_array = @board.transpose
    col_index = cell_coord[1]
    columns_array[col_index].reject {|num| num == "-" }
  end

  def check_box(cell_coord)
    make_boxes_hash
    box_key = find_box_key(cell_coord)
    @boxes[box_key].reject {|num| num == "-"}
  end

  def make_boxes_hash
    @boxes = {
      "Box 1" => [],
      "Box 2" => [],
      "Box 3" => [],
      "Box 4" => [],
      "Box 5" => [],
      "Box 6" => [],
      "Box 7" => [],
      "Box 8" => [],
      "Box 9" => []
    }
    @board.each_with_index do |row,row_i|
      row.each_with_index do |item,col_i|
        if (0..2).include?(row_i)
            if (0..2).include?(col_i)
              @boxes["Box 1"] << item
            elsif (3..5).include?(col_i)
              @boxes["Box 2"] << item
            elsif(6..8).include?(col_i)
              @boxes["Box 3"] << item
            end
        elsif (3..5).include?(row_i)
            if (0..2).include?(col_i)
              @boxes["Box 4"] << item
            elsif (3..5).include?(col_i)
              @boxes["Box 5"] << item
            elsif (6..8).include?(col_i)
              @boxes["Box 6"] << item
            end
        elsif (6..8).include?(row_i)
            if (0..2).include?(col_i)
              @boxes["Box 7"] << item
            elsif (3..5).include?(col_i)
              @boxes["Box 8"] << item
            elsif (6..8).include?(col_i)
              @boxes["Box 9"] << item
            end
        end
      end
    end
    @boxes
  end

  def find_box_key(cell_coord)
    row_i = cell_coord[0]
    col_i = cell_coord[1]
    box_key = ""
    if (0..2).include?(row_i)
      if (0..2).include?(col_i)
        box_key = "Box 1"
      elsif (3..5).include?(col_i)
        box_key = "Box 2"
      else
        box_key = "Box 3"
      end
    elsif (3..5).include?(row_i)
      if (0..2).include?(col_i)
        box_key = "Box 4"
      elsif (3..5).include?(col_i)
        box_key = "Box 5"
      else
        box_key = "Box 6"
      end
    else
      if (0..2).include?(col_i)
        box_key = "Box 7"
      elsif (3..5).include?(col_i)
        box_key = "Box 8"
      else
        box_key = "Box 9"
      end
    end
    box_key
  end

  def fill_cell(cell_coord)
    row = cell_coord[0]
    col = cell_coord[1]
    @board[row][col] = @possible_nums[0]
  end

end


