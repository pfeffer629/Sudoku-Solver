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

p "testing the Board class"
board = Board.new(board_string)
board.create_board
p board.board_array.first == ["-", "-", "-", "2", "6", "-", "7", "-", "1"]
p board.print_board

p "testing the Sudoku class"
game = Sudoku.new(board_string)
# game.solve
# game.find_empty_cell
# puts game

#test code
#board.create_board[0] == board.
