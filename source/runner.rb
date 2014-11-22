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

# sum = 0
# 100.times do
# start = Time.now
# Sudoku.new('---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---').solve
# finish = Time.now
# sum += finish - start
# end

# p sum/100


# averages about 0.0023 seconds, twice as slow as Peter Norvig

