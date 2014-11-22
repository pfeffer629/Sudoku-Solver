require_relative 'sudoku'

game = Sudoku.new("---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---")

puts "Testing board structure"
board_array = game.board_array
p board_array.length == 9
board_array.each {|row|
  p row.length == 9
}

# p board_array

# game.display_board

puts
puts "Testing #to_s method"
p game.to_s == "---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---"

puts
puts "Testing #find_next_empty_cell"
p game.find_next_empty_cell == [0,0]

game2 = Sudoku.new("76926-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---")
p game2.find_next_empty_cell == [0,5]

puts
puts "Testing #get_row"
p game.get_row(game.find_next_empty_cell) == %w(- - - 2 6 - 7 - 1)

puts
puts "Testing #get_column"
p game.get_column(game.find_next_empty_cell) == %w(- 6 1 8 - - - - 7)
p game2.get_column(game2.find_next_empty_cell) == %w(- - 4 - 2 3 - - 8)

puts
puts "Testing #get_box"
test_box1 = game.get_box(game.find_next_empty_cell)
p test_box1 == %w(- - - 6 8 - 1 9 -)
test_box2 = game2.get_box(game2.find_next_empty_cell)
p test_box2 == %w(2 6 - - 7 - - - 4)

puts
puts "Testing find_nums_not_used"
p game.find_nums_not_used(test_box1) == %w(2 3 4 5 7)

puts
puts "Testing find_possible_solutions"
p game.find_possible_solutions(game.find_next_empty_cell) == %w(2 3 4 5 7 8 9)

puts
puts "Testing solve"
# p game2.solve == [0,5]
game.solve
p game.to_s
game.display_board
