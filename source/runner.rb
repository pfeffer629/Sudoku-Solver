require_relative 'sudoku'
require 'benchmark'

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

board_string = '6-873----2-----46-----6482--8---57-19--618--4-31----8-86-2---39-5----1--1--4562--'
# board_string = '-234567-9234567291345678912456789123567891234678912345789123456891234567912345678'

game = Sudoku.new(board_string)

p game.board_arr.flatten

# game.find_blank == [0, 0]
# #  puts game
# p game.check_row #== %w(2 3 4 5 6 7 9)
# p game.check_col
# # puts game
# p game.number_check == "1"
# p game.insert_number
# puts game
# puts game

# game.solve


# puts game
# game.solve
# puts game


game.solve

puts game
# game.solve


puts Benchmark.measure {}


# puts game
# # game.solve
# # puts game
