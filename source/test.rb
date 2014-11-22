require_relative 'sudoku'


board_string = File.readlines('sudoku_puzzles.txt').first.chomp

p game = Sudoku.new(board_string)
# game.solve
# puts game
# p game.find_empty_cell
# p game.find_row_numbers == "---26-7-1".to_a
# p game.find_col_numbers == "-618----7".to_a
# p game.find_nonet == "---68-19-".to_a
