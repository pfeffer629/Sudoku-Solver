class Sudoku
  def initialize(board_string)
    @board_string = board_string

  end
  def create_rows
    # @array_of_strings_rows = @board_string.scan(/.{1,9}/m)
    @board_string.split('').each_slice(9).to_a
  end

  def split_into_cells
    @array_of_strings_rows.each do |string|
      string.split(//)
    end
  end


  def solve
  end

  def board
  end

  # Returns a nicely formatted string representing the current state of the board
  def to_s
  end
end


board1 = Sudoku.new('---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---')

p board1.create_rows
# p board1.split_into_cells
#access the first row
# p board1.create_rows[0]

# access the first three indeces of the first row
# p board1.create_rows[0](0..2) # => '---'
