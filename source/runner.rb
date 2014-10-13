require_relative 'sudoku'

board_1 = "---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---"
board_2 = "--5-3--819-285--6-6----4-5---74-283-34976---5--83--49-15--87--2-9----6---26-495-3"
board_3 = "29-5----77-----4----4738-129-2--3-648---5--7-5---672--3-9--4--5----8-7---87--51-9"
board_4 = "-8--2-----4-5--32--2-3-9-466---9---4---64-5-1134-5-7--36---4--24-723-6-----7--45-"
board_5 = "6-873----2-----46-----6482--8---57-19--618--4-31----8-86-2---39-5----1--1--4562--"
board_6 = "---6891--8------2915------84-3----5-2----5----9-24-8-1-847--91-5------6--6-41----"

game_1 = Sudoku.new(board_1)
game_2 = Sudoku.new(board_2)
game_3 = Sudoku.new(board_3)
game_4 = Sudoku.new(board_4)
game_5 = Sudoku.new(board_5)
# game_6 = Sudoku.new(board_6)

puts "GAME 1"
puts "Unsolved"
game_1.to_s
game_1.solve
puts "Solved"
game_1.to_s

puts "GAME 2"
puts "Unsolved"
game_2.to_s
game_2.solve
puts "Solved"
game_2.to_s

puts "GAME 3"
puts "Unsolved"
game_3.to_s
game_3.solve
puts "Solved"
game_3.to_s

puts "GAME 4"
puts "Unsolved"
game_4.to_s
game_4.solve
puts "Solved"
game_4.to_s

puts "GAME 5"
puts "Unsolved"
game_5.to_s
game_5.solve
puts "Solved"
game_5.to_s

# puts "GAME 6"
# game_6.to_s
# game_6.solve
# game_6.to_s

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
#game.to_s
# game.solve
# game.to_s
