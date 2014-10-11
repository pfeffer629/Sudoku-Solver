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


    #
  end

  def get_row
    @sudoku.each do |row|
      if row != "-"
        values << row
      end
    end
    values
  end

  def get_col
    @sudoku.transpose.each do |col|
      p col
    end
  end

  def get_box
    box_row = @sudoku[0..2]
    p box_row
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

  def check_row
    #checking for numbers that haven't been used


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
p game.get_row
# puts "-"*20
# p game.get_col
# puts "-"*20
# p game.find_empty_cells
# puts "-"*20
# game.check_row
# puts "-"*20
# game.get_box