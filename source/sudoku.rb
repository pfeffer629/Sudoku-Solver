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
  # Returns a nicely formatted string representing the current state of the board
  def to_s
  end
end



test_board = "4-526978168257493197834562826195347374682915951743628519326874248957136763418259"
game = Sudoku.new(test_board)
p game.get_row(6)
