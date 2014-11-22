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

# game = Sudoku.new(board_string)

board_string = '---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---'
# board_string = '-234567-9234567291345678912456789123567891234678912345789123456891234567912345678'

game = Sudoku.new(board_string)

"- - - 2 6 - 7 - 1"
"6 8 - - 7 - - 9 -"
"1 9 - - - 4 5 - -"
"8 2 - 1 - - - 4 -"
"- - 4 6 - 2 9 - -"
"- 5 - - - 3 - 2 8"
"- - 9 3 - - - 7 4"
"- 4 - - 5 - - 3 6"
"7 - 3 - 1 8 - - -"

"- 3 5 2 6 0 7 8 1"
"6 8 2 5 7 1 - 9 3"
"1 9 7 8 3 4 5 6 2"
"8 2 6 1 0 - 3 4 -"
"3 - 4 6 - 2 9 - -"
"- 5 - - - 3 - 2 8"
"- - 9 3 - - - 7 4"
"- 4 - - 5 - - 3 6"
"7 - 3 - 1 8 - - -"

# game.find_blank == [0, 0]
# #  puts game
# p game.check_row #== %w(2 3 4 5 6 7 9)
# p game.check_col
# # puts game
# p game.number_check == "1"
# p game.insert_number
# puts game
puts game

game.solve
puts game


# puts game
# game.solve
# puts game





# game.solve





# puts game
# # game.solve
# # puts game
