require_relative 'sudoku'

# The sudoku puzzles that your program will solve can be found
# in the sudoku_puzzles.txt file.
#
# Currently, Line 16 defines the variable board_string to equal
# the first puzzle (i.e., the first line in the .txt file).
# After your program can solve this first puzzle, edit
# the code below, so that the program tries to solve
# all of the puzzles.
#
# Remember, the file has newline characters at the end of each line,
# so we call String#chomp to remove them.


# board_string = File.readlines('sudoku_puzzles.txt').first.chomp
board_string = '---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---'

#testing solved? method when board is not solved
game = Sudoku.new(board_string)
puts game.board == [["-", "-", "-", "2", "6", "-", "7", "-", "1"], ["6", "8", "-", "-", "7", "-", "-", "9", "-"], ["1", "9", "-", "-", "-", "4", "5", "-", "-"], ["8", "2", "-", "1", "-", "-", "-", "4", "-"], ["-", "-", "4", "6", "-", "2", "9", "-", "-"], ["-", "5", "-", "-", "-", "3", "-", "2", "8"], ["-", "-", "9", "3", "-", "-", "-", "7", "4"], ["-", "4", "-", "-", "5", "-", "-", "3", "6"], ["7", "-", "3", "-", "1", "8", "-", "-", "-"]]
puts game.solved?

#testing solved? method when board is solved
board_string = '---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---'
game = Sudoku.new(board_string)
puts game.solved?

# test find next empty cell
board_string = '---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---'
game = Sudoku.new(board_string)
# test fing empty cell coords
puts "-------next_empty_cell_index--------"
p game.next_empty_cell_index   #=> what are the coordinates?
puts "-------set_current_empty_cell_coords--------"
p game.set_current_empty_cell_coords
puts "-------get_column--------"
p game.get_column
puts "-------get_row--------"
p game.get_row
puts "-------get_box--------"
p game.get_box

# board_string.get_row(0)

# using 2 loops and the loop keeps track of the coords

# - find the coordinates of the next empty cell
# - empty_cell?
# - empty_cell
# -

# game.solve
# puts game
