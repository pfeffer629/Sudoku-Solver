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

# (0..2).each do |i|
# board_string = File.readlines('sudoku_puzzles.txt')[i].chomp

# game = Sudoku.new(board_string)
# game.solve
# puts game
# end
game = Sudoku.new('--5-3--819-285--6-6----4-5---74-283-34976---5--83--49-15--87--2-9----6---26-495-3')
game.solve
puts game

game = Sudoku.new('29-5----77-----4----4738-129-2--3-648---5--7-5---672--3-9--4--5----8-7---87--51-9')
game.solve
puts game

game = Sudoku.new('-8--2-----4-5--32--2-3-9-466---9---4---64-5-1134-5-7--36---4--24-723-6-----7--45-')
game.solve
puts game

game = Sudoku.new('6-873----2-----46-----6482--8---57-19--618--4-31----8-86-2---39-5----1--1--4562--')
game.solve
puts game

