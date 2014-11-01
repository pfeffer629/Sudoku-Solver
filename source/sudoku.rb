# PSEUDOCODE
 # 1) INPUT: string of 81 characters, -'s are empty cells
 # 2) OUTPUT: string of 81 numbers from 1 to 9
 # 3) PROCESS:
 #    o) RETURN solved board if total sum of numbers is 405
 #    o) CREATE the CHECK arrays of rows, columns and grids

 #    i) FIND next empty CELL
 #    ii) CHECK related groups of cells
 #      a) ROW
 #      b) COLUMN
 #      c) GRID
 #    iii) COLLATING the total taken values
 #    iv) IF there is a unique solution THEN enter the value in the grid
 #    v)  ELSE then REPEAT the process from step i)


board_string = '---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---'

class Sudoku
  attr_reader :all_rows, :all_columns, :all_grids
  def initialize(board_string)
    @board_string = board_string
    @all_rows, @all_columns = []
    @all_grids = Array.new(9) { Array.new }
    update_all_possibilities
  end

  def populate_rows
    @all_rows = []
    @board_string.chars.each_slice(9) {|row| @all_rows << row.to_a}
  end

  def populate_cols
    @all_columns = @all_rows.transpose
  end

  def populate_grids
    @all_grids.each {|array| array.clear}
    @board_string.chars.each_with_index do |char, index|
      grid_index = ((index / 27) * 3 + (index % 9) / 3)
      @all_grids[grid_index] << char
    end
  end

  def update_all_possibilities
    populate_rows
    populate_cols
    populate_grids
  end

  def solve
    until @board_string.match('-') == nil
      @board_string.chars.each_with_index do |cell, index|
        grid_index = ((index / 27) * 3 + (index % 9) / 3)
        row_index, col_index = index.divmod(9)
          next if cell != '-'
          @possibilities = %w(1 2 3 4 5 6 7 8 9)
          @possibilities -= @all_rows[row_index] + @all_columns[col_index] + @all_grids[grid_index]
          @board_string[index] = @possibilities[0] if @possibilities.length == 1
      end
      update_all_possibilities
      solve
    end
  end

  def board
    @board_string
  end

  # Returns a nicely formatted string representing the current state of the board
  def to_s
    counter = 0
    @all_rows.each do |row|
      puts row.join(' | ')
      counter += 1
      if counter == 3
        puts '---------------------------------'
        counter = 0
      end
    end
  end

end

