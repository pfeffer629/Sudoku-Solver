=begin 

#Brick's pseudocode

1. create board

2. test if complete

3. Find next empty

4. find all related cells
			-row
			-column
			-box

5. screen related and test for unique 

6. if unique solution
		enter it
	 if not start at step 2 again and go through
	 same process


=end





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
    									 
  end

  def get_box_nums
  	#still need to find syntax for how to collect nums 
  	#from box
  	#these are the results we want below for box1
    @box_nums_used = [
	   [6,8,1,9], #box_nums_used[0]
	   [2,6,7,4], #box_nums_used[1]
	   [7,1,9,5], #box_nums_used[2]
	   [8,2,4,5], #box_nums_used[3]
	   [1,6,2,3], #box_nums_used[4]
	   [4,9,2,8], #box_nums_used[5]
	   [9,4,7,3], #box_nums_used[6]
	   [3,5,1,8], #box_nums_used[7]
	   [7,4,3,6]  #box_nums_used[8]
	  ]
	  end

  def remove_used_nums
  	@possible_nums = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

  	p "-_-"*50
  	
  	# p "*"*50
  	# p @column_nums_used
  	# p "-"*50
  	# p @box_nums_used
  	p "_"*50

  	@coords.each_with_index do |coordinates|
  		p @row_nums_used[0], @column_nums_used[1]
  	end

	   @answers = []	
	  #answers would be the keyvalues for each empty key

	  #for example [0,0] would be used_row_nums[0], 
	   #used_column_nums[0], box_nums[0] 

	  #add all those numbers together and subtract from 
	  # possible numbers array

	  @answers = []

  	p @replacement_nums = Hash[@coords.zip(@answers)]

  	p "*" * 50
  	p @replacement_nums[[0,0]] = @possible_nums - (@row_nums_used[0] + @column_nums_used[0] + @box_nums_used[0])

  	p @replacement_nums[[0,1]] = @possible_nums - (@row_nums_used[0] + @column_nums_used[1] + @box_nums_used[0])

  	p @replacement_nums[[0,2]] = @possible_nums - (@row_nums_used[0] + @column_nums_used[2] + @box_nums_used[0])
  	
  	p @replacement_nums[[1,2]] = @possible_nums - (@row_nums_used[1] + @column_nums_used[2] + @box_nums_used[0])
  	
  	p @replacement_nums[[2,2]] = @possible_nums - (@row_nums_used[2] + @column_nums_used[2] + @box_nums_used[0])
  	
  	p @replacement_nums[[4,0]] = @possible_nums - (@row_nums_used[4] + @column_nums_used[0] + @box_nums_used[3])
  	
  	p @replacement_nums
  	# @replacement_nums[[row_coord, column_coord]] = @possible_nums - (@row_nums_used[row_coord] + @column_nums_used[column_coord] + @box_nums_used[box_nums])

  			#need to give box num a range
  				# if row_coords >= 0 || row_coords <=2
  						#box_nums_used[0]
  					# elsif row_coords >=3 || row_coord <=5
  					# 	box_nums_used[1]
  					# elsif row_coord >=6 || row_coord <=9
  					# 	box_nums_used[2]
  						
  						



  	#p @replacement_nums[@coords[0]] = @used_row_nums 

  	# p @used_nums = @row_nums_used + @column_nums_used + @box_nums_used
  	
  	# p @replacement_nums = Hash[@coords.zip(@used_nums)]
  	# p @unique_nums = @possible_nums - @used_nums.sort! 
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

  # p new_nums = Array.new(@coords.length)
	
	# p @replacement_nums = Hash[@coords.zip(new_nums)]
  
 #  # this method will replace each empty cell with an array
 #  #  of possible numbers

 #  replacement_nums.each {|key, value| replacement_nums[key] = @unique_nums}
 #  # puts "-"*20
 #  # p replacement_nums
  	
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
game.get_row_nums
game.get_column_nums
game.get_box_nums
p game.remove_used_nums

# p game.change_blank_cells

