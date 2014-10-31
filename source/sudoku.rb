class Sudoku
  def initialize(board_string)
    @board_string = board_string
  end

  def solve
  end

  def board
  end

  def get_row(index) #pass index from @board_string
    row_index = index #preserve index, make a copy of it and do stuff to the copy
    constructed_row = [] #this array will hold all the numbers in our row
    until row_index % 9 == 0 || row_index == 0 # given an index in a row keep moving left until we find the beginning of the row
      row_index -= 1 #walk backwards
    end
    9.times do #starting from beginning of row
      constructed_row << @board_string[row_index] #load the characters in the row into our array
      row_index += 1 #move to next cell in the row
    end
    constructed_row #return array of characters
  end

  def get_column(index)
    column_index = index #copy index of the cell on the board
    constructed_column = [] #create empty array that will hold our column
    until column_index >= 0 && column_index <= 8 #move up the column until you know you're at the top row(top row is 0-8)
        column_index -= 9
    end
    9.times do
      constructed_column << @board_string[column_index] #shovel each cell in the column
      column_index += 9 #move one cell down
    end
    constructed_column #return the whole column
  end

  def find_next_empty_cell(index)
    board_string_copy = @board_string.split("") #protect our original data
    index+=1 #skip to the next index right off the bat.
    until board_string_copy[index] == '-' do #keep skipping to the next index until we find a '-'
      index += 1
    end
    index #return the index of the next '-' we find.
  end

  def collect_numbers(index)
    my_row = get_row(index) #get an array of characters on the row. There will be "-"s included
    my_column = get_column(index) ##get an array of characters on the column. There will be "-"s included
    results = (my_row + my_column).select { |cell| cell != '-'  } #add everything together and eliminate "-"
    results.uniq! #de duplicate
  end
  # Returns a nicely formatted string representing the current state of the board
  def to_s
  end
end


=begin
test_board = "4-5269781
              682574931
              978345628
              261953473
              746829159
              517436285
              193268742
              489571367
              634182594"
=end
test_board = "----657816825-4931978345628261953473746829159517436285193268742489571367634182594"
game = Sudoku.new(test_board)
p game.get_row(6) == game.get_row(8) #calling get_row with index on same row should get same result.
p game.get_row(13) == game.get_row(10)
p game.get_column(0) == game.get_column(54) #calling get_column with an index on the same column, you should get the same column!
p game.get_column(50) == game.get_column(77)

p game.find_next_empty_cell(0) #=> 1
p game.find_next_empty_cell(1) # => 2
p game.find_next_empty_cell(2) # => 3
p game.find_next_empty_cell(3) # => 13




