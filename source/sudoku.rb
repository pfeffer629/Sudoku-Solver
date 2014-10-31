class Sudoku
  attr_reader :rows, :columns, :board_string
  def initialize(board_string)
    @board_string = board_string
    @column_array = []
  end
  def create_rows #array of 9 arrays of 9 strings
    # @array_of_strings_rows = @board_string.scan(/.{1,9}/m)
    @rows = @board_string.split('').each_slice(9).to_a
  end

  def single_column(column)
    @rows.map { |rows| rows[column] }
  end

  def create_columns
    9.times do |i|
      @column_array << create_column(i)
    end
      @column_array
  end

  def

  def split_into_cells #
     @board_string.split('').each_slice(1).to_a
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

puts "Test create_rows"
p board1.create_rows

puts "Test create_columns"

# p board1.create_column

p board1.collect_columns
# puts "Test split_into_cells"
# p board1.split_into_cells

#access the first row
# p board1.create_rows[0]

# access the first three indeces of the first row
# p board1.create_rows[0](0..2) # => '---'
