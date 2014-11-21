require_relative 'sudoku'

game = Sudoku.new("---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---")

puts "Testing board structure"
board_array = game.board_array
p board_array.length == 9
board_array.each {|row|
  p row.length == 9
}
