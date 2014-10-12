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


  def get_row_nums #only returns one specific row 
  	#for each coordinate in empty_num, get all the numbes
  	# that have aleady been used in that row
  	@row_nums_used = @sudoku.map do |row|
  										row.map do
  										  
  										|n| n[(/\d/)].to_i
  									end
  								end
  	#converts nil values to 0 and then remove 0 from array

  	# @total_rows = (0..8).to_a
  	# p "-"*30
  	# row_nums_used = Hash[@total_rows.zip(@row_nums_used)]
  end

  def get_column_nums # only returns one specific column
  	@column_nums_used = @sudoku.transpose.map do |column|
    										column.map  do 
    											|n| n[(/\d/)].to_i
    										end
    									end
    									p "*"*55
    									p @column_nums_used
  end

  def get_box_nums
  	#still need to find syntax for how to collect nums 
  	#from box
  	#these are the results we want below for box1
    @box_nums_used = {
    :box1_nums => [6,8,1,9],
    :box2_nums => [2,6,7,4],
    :box3_nums => [7,1,9,5],
    :box4_nums => [8,2,4,5],
    :box5_nums => [1,6,2,3],
    :box6_nums => [4,9,2,8],
    :box7_nums => [9,4,7,3],
    :box8_nums => [3,5,1,8],
    :box9_nums => [7,4,3,6]
  }
  end

  def remove_used_nums
  	@possible_nums = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

  	p @used_nums = @row_nums_used + @column_nums_used #+ @box1_nums
  	p "*"*50
  	p @unique_nums = @possible_nums - @used_nums.sort! 
  	#subtracts used_numbers from possible_nums to give unique values

  	#create a hash to represent the unique numbers for
  	# the empty numbers

  	# the key will be the coordinates, the value will be
  	# the unique_nums array

  	# when the unique_nums.length == 1, return the number
  	  #in that array

  	# otherwise, continue to go through the array

  end

  def get_columns
    @sudoku.transpose.each do |col|
      col
    end
  end




  def find_empty_cells
    @coords = []
    @sudoku.each_with_index do |_,row_index|
    @sudoku[row_index].each_with_index do |val, col_index|
      if val == "-"
        @coords << [row_index, col_index]
      end
      end
    end
    p @coords
  end

  def change_blank_cells
   
  #go through all the coords empty coordsnates

  #at each empty coordinate get the row_nums, column_nums
   #and box_nums

  #put row_num, column_nums and box_nums into an array

  #subtract that array from possible_nums

  #replace the numbers left over into the coordintes

  p new_nums = Array.new(@coords.length)
	
	p replacement_nums = Hash[@coords.zip(new_nums)]
  
  # this method will replace each empty cell with an array
  #  of possible numbers

  replacement_nums.each {|key, value| replacement_nums[key] = @unique_nums}
  # puts "-"*20
  # p replacement_nums
  	
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
game.find_empty_cells
puts "-"*40
p game.get_row_nums
p game.get_column_nums
p game.get_box_nums
p game.remove_used_nums

# p game.change_blank_cells

