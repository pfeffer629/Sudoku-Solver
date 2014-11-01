=begin

empty cell?
check relational cells - pros / cons
cross ref values
check if there's a unique #
jam unique numbers into the cell

PIECES:
row = an array of array
columns = row.transpose, repeat processes
nonets = 9 cell sub-grid

ACTION PLAN:

  ID the empty cell
    Collect row, column & nonet values (maybe flatte? probably not?)
    Two collection: numbers we have, missing numbers
          If missing numbers are unique - injevt it into the empty place
  Move onto next exmpty cell - recursion
      One you get to the end of the board loop through- continue looping until no empty cells.
=end
class Sudoku
  attr_accessor :columns_array, :board_string, :rows_hash
  def initialize(board_string)
    @board_string = board_string
    add_vals
  end



#  ROW STUFF

# defining the key names 0-8

# creating a method to attch value to key in a hash of rows
def add_vals
row_names = (0..8).to_a
# grouping row values in sets of 9
row_values = @board_string.chars.each_slice(9) { |slice| slice.join }
p row_values
@rows_hash = {}
  # for each row:
  row_values.each_with_index do |row, index|
    row_names.each do |name|
      rows_hash[name] = row(index..index + 8)
    end
  end
  p rows_hash
end

# rows_hash.each {|key| row_values.each { |slice| key => slice.join } }
#   def get_row
#         #  convert string to array of chararcters
#         #  slice each (9)
#         #  join them back into a string
#         #  return the row based on the empty cell's position
#   rows_hash = Hash.new((0..9))
#   @board_string.chars.each_slice(9) { |slice| rows_hash.each_pair {|key,val| key(0..9)[slice.join] }
#   (0..9).to_a.each_with_index {|}

# # rows.each { |char| char.slice(9) }
#       end


#  COLUMN STUFF


# NONET STUFF

    #   def nonet_indices_lookup
  #     rows = string

  #   # [[0,1,2,9,10,11,18,19,20],[...],[...],[],[],[],[],[],[],[]]
  #   # nonet string index, nonet string index array, nonet index array, nonet indices, nonet_indices_lookup[0]
  #   # nonet1 = ["-","-","_",]
  #   # def find_num(nonet)
  #   #   { (index/27)*3 + (index/9)/3 } }
  #   # end

  #   # (0..80).to_a.group_by { |index| p (index/27)*3 + (index%9)/3 }
  #   # start w/ an string to an array - 81 chars
  #   # find the nonet number associated with each char
  #   # group each char into the nonet grouping
  #   # group each char according the the nonet number calculated
  #   # group_by { |_, index| }

# Archive stuff
# @board_array = board_string.chars.map! { |character|  character == '-' ? character = 0 : character.to_i}
# @rows_array = []
#     @board_array.each_slice(9) {|slice| @rows_array << slice}
#     @columns_array = @rows_array.transpose
#     # @nonets = @rows_array.map do |row|
#     #   row[0][0], row[0][1],
#     # p @nonets = board_string.chars.to_i { |var| var.each_with_index { |char, index| (index/27)*3 + (index/9)/3 } }
#     @nonet_indices_lookup = @board_array.join { |var| var.each_with_index { |char, index| (index/27)*3 + (index%9)/3 } }

  def solve
  end

  def board
  end

  # Returns a nicely formatted string representing the current state of the board
  def to_s
  end
end



# DRIVER TESTS
# board_string =
# "- - - 2 6 - 7 - 1
# 6 8 - - 7 - - 9 -
# 1 9 - - - 4 5 - -
# 8 2 - 1 - - - 4 -
# - - 4 6 - 2 9 - -
# - 5 - - - 3 - 2 8
# - - 9 3 - - - 7 4
# - 4 - - 5 - - 3 6
# 7 - 3 - 1 8 - - -"

board_string = '---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---'


game = Sudoku.new(board_string)
# game.get_row
p game

# setup row arrays, col arrays, nonet lookup
# p game.rows_array
# p game.cols_array

# game.next_empty_cell_index  # => integer of the next empty cell
# game.get_row_vals  # index
# game.get_col_vals  # index
# game.get_nonet_vals #

# z.nonets(30)
# # p z.columns_array

# # p rows_array.each { |row| row.reduce(:+) == 45}

