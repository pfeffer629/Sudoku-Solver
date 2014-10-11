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


board_string = File.readlines('sudoku_puzzles.txt').first.chomp

game = Sudoku.new(board_string)
game.solve
puts game
puts "printing if game has empty cells:"
puts game.empty_cells?
puts "prints next empty cell"
#cell_coords = game.find_next_empty_cell
puts "testing get_row"
cell_coords = [4,1]
test_row = game.get_row(cell_coords)
puts "testing get_col"
test_col = game.get_col(cell_coords)
puts "testing calc remaining nums"
remaining_nums = game.calc_remaining_nums(test_row, test_col)

puts "testing process remaining num:"
game.process_remaining_num(remaining_nums,cell_coords)
puts "printing out board: "
puts game

