class Sudoku
  attr_reader :puzzle, :solver, :rows, :columns, :blocks
  # create instance variables for board, solver, rows, columns, blocks
  def initialize(board_string)
    @puzzle = self.board(board_string)
    @solver = self.generate_solver_array(@puzzle)
    @rows = self.generate_rows(board_string)
    @columns = self.generate_columns(board_string)
    @blocks = self.generate_blocks(board_string)
  end


  # Solved?
  def solved?
    return true if @solver.flatten.join("").length == 81
    return false if @solver.flatten.join("").length > 81
    return "Error ERROR ERROOOOORRRRR"
  end

  def board(board_string)
    ary = board_string.split('')
    board_array = []
    until ary.length == 0
      board_array << ary.shift(9)
    end
    return board_array
  end

  # Returns a nicely formatted string representing the current state of the board
  def to_s(nested_ary=@puzzle)
     nested_ary.each{|row| puts row.to_s + "\n"}
  end

  #solver array holds "notes", possible answers in each cell instead of dashes
  # solver array = hidden array copy of board with possible answers instead of dash
  def generate_solver_array(board)
    array = board.flatten.map { |cell| cell.gsub(/-/, "123456789") }
    solver_array = []
    until array.length == 0
      solver_array << array.shift(9)
    end
    return solver_array
  end

  #rows = board array with "-" deleted
  def generate_rows(board_string)
    ary = board_string.split('')
    rows = []
    until ary.length == 0
      rows << ary.shift(9)
    end
    rows.each{|row| row.delete("-")}
    # rows.each{|row| row.delete_if{|cell| cell.length > 1}}
  end

  #columns = rows.transpose
  def generate_columns(board_string)
    ary = board_string.split('')
    cols = []
    until ary.length == 0
      cols << ary.shift(9)
    end
    columns = cols.transpose.each{|column| column.delete("-")}
  end


  def generate_blocks(board_string)
    blocks = [[],[],[],[],[],[],[],[],[]]
    ary =  board_string.split(//)
    i = 0
    9.times do
      i = 0 if i >= 3
      blocks[i] << ary.shift(3)
      i += 1
    end
    j = 3
    9.times do
      j = 3 if j >= 6
      blocks[j] << ary.shift(3)
      j += 1
    end
    k = 6
    9.times do
      k = 6 if k >= 9
      blocks[k] << ary.shift(3)
      k += 1
    end
    blocks.each{|block| block.flatten!.delete("-")}
    return blocks
  end

  # check each cell against rows, columns, blocks
  # => delete numbers from cell matching elements of row, column, block arrays
  # => if cell.length == 1, add to solution, also add to row, column, block
  # => move to next cell if cell.length > 1
  def check
    #until self.solved? == true
      #for each element in solver
      # check_row
      #check_column
      #check_block
      #update_row/col/block
      #end
      #p solution as a string
      # p @solver
  end

  def check_row
    i = 0
    9.times do
      @solver[i].each{|cell| cell.delete!(@rows[i].join("")) if cell.length > 1}

      i += 1
    end
  end

  def check_column
    i = 0
    @solver = @solver.transpose
    9.times do
      @solver[i].each{|cell| cell.delete!(@columns[i].join("")) if cell.length > 1}
      i += 1
    end
    @solver = @solver.transpose
  end

  def update_row_column_block
    updates = Marshal.load(Marshal.dump(@solver))
    updates.each{|row| row.each{|cell| cell.gsub!(/\d{2,}/, "-")}}
    updates = updates.flatten.join("")
    @rows = self.generate_rows(updates)
    @columns = self.generate_columns(updates)
    # UPDATE BLOCKS
  end

  def check_block
    #TO DO: CHECK BLOCKS
  end
end

#"abcdef".delete("bf")

my_board = Sudoku.new("---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---")

my_board.to_s
p ""
my_board.check_column
my_board.check_row
my_board.update_row_column_block
my_board.to_s(my_board.solver)

p ""
my_board.check_column
my_board.check_row
my_board.update_row_column_block
my_board.to_s(my_board.solver)
p ""
my_board.check_column
my_board.check_row
my_board.update_row_column_block
my_board.to_s(my_board.solver)


