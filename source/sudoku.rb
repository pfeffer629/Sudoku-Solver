class Sudoku
  def initialize(board_string)
  	@board = board_string.split('').to_a.each_slice(9).to_a
  end


  def solve
  	@current_row = 0
  	@current_column = 0
  	@flattened_board = @board.flatten
  	@flattened_board.each_with_index do |r, i|
  		if r == "-"
  			@current_row = i /9
  			@current_column = i % 9
  			end
  		end
  end

  

  def get_row
  	@board[@current_row]
  end

  def get_col
  	@board.transpose[@current_column]
  end

  def get_box
  	@row_coord = @current_row.to_i / 3
  	@col_coord = @current_column.to_i % 3 
  	@current_box = []
  	@board.each_with_index do |row, row_index|
  		if row_index >= @row_coord * 3 && row_index < @row_coord * 3 + 3
  			row.each_with_index do |col, col_index|
  				# if @col_coord * 3 <= col_index && col_index < @col_coord * 3 + 3
  				# if col_index >= @col_coord * 3 && col_index <  @col_coord * 3 + 3
  				## problem is above doe
  					# @current_box << @board[row_index][col_index]
  					@current_box << @board[row_index][col_index]
  				end
  			end
  		end
  	end
  	@current_box
  end

  def board
  end

  # Returns a nicely formatted string representing the current state of the board
  def to_s
  end
end


# Test Code
# String = 4-5269781682571493197834562826195347374682915951743628519326874248957136763418259
def assert
	raise "Assertion Failed" unless yield
end
sudoku = Sudoku.new("4-5269781682571493197834562826195347374682915951743628519326874248957136763418259")
sudoku.solve
# assert{sudoku.solve ==[0,0]}
assert{sudoku.get_row == ["4", "-", "5", "2", "6", "9", "7", "8", "1"]}
assert{sudoku.get_col.first == "-"}
p sudoku.get_box