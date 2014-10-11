# initialize board string
# prepare board with board method



# create three separate methods
  # get_row_nums
    #check the numbers that are already in each row
    #find empty row entries
    #look for "-"
      # if there is "-"
      #

  # get_column_nums
  # check_box
  #
    #solve
    # filling in each dash with a number between 1 through 9
    # possibilities = (1..9)
    # get

class Sudoku
  attr_reader :sudoku
  def initialize(board_string)
    @board_string = board_string
    @sudoku = @board_string.chars.each_slice(9).to_a
  end

  def solve
    possibilities = (1..9).to_a
  end

  def get_rows
    @sudoku.each do |row|
     row
    end 
   end

  def get_row_nums #only returns one specific row 
  	@row_zero = @sudoku[0]
  	@row_nums_used = @row_zero.map do  
  		|n| n[(/\d/)].to_i
  	end
  	#converts nil values to 0 and then remove 0 from array
  	@row_nums_used.reject! {|nums| nums == 0}
  end

  def get_column_nums # only returns one specific column
  	@column_zero = @sudoku.transpose[0]
    @column_nums_used =	@column_zero.map {|n| n[(/\d/)].to_i}

  # #converts nil values to 0 and then remove 0 from array
   	@column_nums_used.reject! {|nums| nums == 0}
  end





  def get_box_nums
  	#still need to find syntax for how to collect nums 
  	#from box
  	#these are the results we want below for box1
    @box1_nums = [6,8,1,9]
  end

  def remove_used_nums
  	@possible_nums = [1, 2, 3, 4, 5, 6, 7, 8, 9]

  	@used_nums = @row_nums_used + @column_nums_used + @box1_nums

  	p @possible_nums - @used_nums.sort! 
  	#subtracts used_numbers from possible_nums to give unique values


  	# compare those numbers to the possible num array

  	# if the number occurs, remove it from possible nums

  	#compares list of all numbers used to possible numbers list
  	#as there are duplicates, remove from possible number list
  	#when there is only 1 unused number, put that number into
  	# the empty cell area
  end

  def get_columns
    @sudoku.transpose.each do |col|
      col
    end
  end




  def find_empty_cells
    coords = []
    @sudoku.each_with_index do |_,row_index|
    @sudoku[row_index].each_with_index do |val, col_index|
      if val == "-"
        coords << [row_index, col_index]
      end
      end
    end
    p coords
  end



  # def check_column
  # end

  # def check_box

  # end

  # Returns a nicely formatted string representing the current state of the board
  def to_s
    puts "#{@sudoku}"
  end

end

board = '---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---'

game = Sudoku.new(board)
# p game
# p game.board
game.get_row_nums
game.get_column_nums
game.get_box_nums
# puts "---this is check_all_numbs----"
puts "-"*20
game.remove_used_nums
# puts "-"*20
# p game.find_empty_cells
# puts "-"*20
# game.check_row
# puts "-"*20
# game.get_box