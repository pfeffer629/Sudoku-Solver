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

  def solve
  	i = 0
    until self.solved? == true || i > 5000
      self.check_row
      self.check_column
      self.check_block
      self.update_row_column_block
      i += 1
    end
     self.to_s(@solver) 
     p @solver.flatten.join("")
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
    @blocks = self.generate_blocks(updates)
  end

  def check_block
    for i in 0..81
      if i / 9 < 3 && i % 9 < 3
        @solver.flatten[i].delete!(@blocks[0].join("")) if @solver.flatten[i].length > 1
      elsif i / 9 < 3 && i % 9 < 6
        @solver.flatten[i].delete!(@blocks[1].join("")) if @solver.flatten[i].length > 1
      elsif i / 9 < 3 
        @solver.flatten[i].delete!(@blocks[2].join("")) if @solver.flatten[i].length > 1
      elsif i / 9 < 6 && i % 9 < 3
        @solver.flatten[i].delete!(@blocks[3].join("")) if @solver.flatten[i].length > 1
      elsif i / 9 < 6 && i % 9 < 6
        @solver.flatten[i].delete!(@blocks[4].join("")) if @solver.flatten[i].length > 1
      elsif i / 9 < 6 
        @solver.flatten[i].delete!(@blocks[5].join("")) if @solver.flatten[i].length > 1
			elsif i / 9 < 9 && i % 9 < 3
        @solver.flatten[i].delete!(@blocks[6].join("")) if @solver.flatten[i].length > 1
      elsif i / 9 < 9 && i % 9 < 6
    	  @solver.flatten[i].delete!(@blocks[7].join("")) if @solver.flatten[i].length > 1
      elsif i / 9 < 9 
        @solver.flatten[i].delete!(@blocks[8].join("")) if @solver.flatten[i].length > 1
      end
    end
  end
end


my_board = Sudoku.new("---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---")

puzzle1 = Sudoku.new("---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---")
puzzle2 = Sudoku.new("--5-3--819-285--6-6----4-5---74-283-34976---5--83--49-15--87--2-9----6---26-495-3")
puzzle3 = Sudoku.new("29-5----77-----4----4738-129-2--3-648---5--7-5---672--3-9--4--5----8-7---87--51-9")
puzzle4 = Sudoku.new("-8--2-----4-5--32--2-3-9-466---9---4---64-5-1134-5-7--36---4--24-723-6-----7--45-")
puzzle5 = Sudoku.new("6-873----2-----46-----6482--8---57-19--618--4-31----8-86-2---39-5----1--1--4562--")
puzzle6 = Sudoku.new("---6891--8------2915------84-3----5-2----5----9-24-8-1-847--91-5------6--6-41----")
puzzle7 = Sudoku.new("-3-5--8-45-42---1---8--9---79-8-61-3-----54---5------78-----7-2---7-46--61-3--5--")
puzzle8 = Sudoku.new("-96-4---11---6---45-481-39---795--43-3--8----4-5-23-18-1-63--59-59-7-83---359---7")
puzzle9 = Sudoku.new("----754----------8-8-19----3----1-6--------34----6817-2-4---6-39------2-53-2-----")
puzzle10 = Sudoku.new("3---------5-7-3--8----28-7-7------43-----------39-41-54--3--8--1---4----968---2--")
puzzle11 = Sudoku.new("3-26-9--55--73----------9-----94----------1-9----57-6---85----6--------3-19-82-4-")
puzzle12 = Sudoku.new("-2-5----48-5--------48-9-2------5-73-9-----6-25-9------3-6-18--------4-71----4-9-")
puzzle13 = Sudoku.new('--7--8------2---6-65--79----7----3-5-83---67-2-1----8----71--38-2---5------4--2--')
puzzle14 = Sudoku.new("----------2-65-------18--4--9----6-4-3---57-------------------73------9----------")
#puzzle15 = Sudoku.new("---------------------------------------------------------------------------------")



# puzzle1.solve
# p puzzle1.solved?
# puzzle2.solve
# p puzzle2.solved?
# puzzle3.solve
# p puzzle3.solved? 
# puzzle4.solve
# p puzzle4.solved? 
# puzzle5.solve
# p puzzle5.solved? 
puzzle6.solve
p puzzle6.solved? 
puzzle7.solve
p puzzle7.solved? 
puzzle8.solve
p puzzle8.solved? 
puzzle9.solve
p puzzle9.solved? 
puzzle10.solve
p puzzle10.solved? 
puzzle11.solve
p puzzle11.solved? 
puzzle12.solve
p puzzle12.solved? 
puzzle13.solve
p puzzle13.solved? 
puzzle14.solve
p puzzle14.solved? 
# puzzle15.solve
# p puzzle15.solved? 


