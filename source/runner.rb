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


board_strings = File.readlines('sudoku_puzzles.txt')
board_strings.each_with_index do |line, index|
  exit if index==6
  if line.chomp != "---------------------------------------------------------------------------------"
    puts line.chomp
    game = Sudoku.new(line.chomp)
    game.solve
    puts game
  end
end

# board_string = File.readlines('sudoku_puzzles.txt').first.chomp

# game = Sudoku.new(board_string)
# puts game
# game.solve
# puts game
