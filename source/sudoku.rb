class Sudoku
  def initialize(board_string)
    @board_string = board_string
    @board_arr = @board_string.split('').each_slice(9).to_a
  end

  def board
  	@board_arr.length.times do |num|
  		p solve[num].join(' ')
  	end
  end

  def one_column_check(column) # Only numbers 0-8
    possibilities = ['1','2','3','4','5','6','7','8','9']
    @board_arr.transpose[column].map { |num|
      if possibilities.include?(num)
        possibilities.delete(num)
      end}
    possibilities
  end

  def column_check(cell_index) # only numbers 0-80
    one_column_check(cell_index%9)
  end

  def one_row_check(row) # only numbers 0-8
    possibilities = ['1','2','3','4','5','6','7','8','9']
    @board_arr[row].map { |num|
      if possibilities.include?(num)
        possibilities.delete(num)
      end}
    possibilities
  end

  def row_check(cell_index) # only numbers 0-80
    one_row_check(cell_index/9)
  end

  def one_box_check(row, range)
    possibilities = ['1','2','3','4','5','6','7','8','9']
    boxed_area = @board_arr[row][range] + @board_arr[row+1][range] + @board_arr[row+2][range]
    boxed_area.map {|num|
      if possibilities.include?(num)
        possibilities.delete(num)
      end}
    possibilities
  end

  def box_check(cell_index)
    case cell_index
    when 0..2, 9..11, 18..20
      one_box_check(0, 0..2)
    when 3..5, 12..14, 21..23
      one_box_check(0, 3..5)
    when 6..8, 15..17, 24..26
      one_box_check(0, 6..8)
    when 27..29, 36..38, 45..47
      one_box_check(3, 0..2)
    when 30..32, 39..41, 48..50
      one_box_check(3, 3..5)
    when 33..35, 42..44, 51..53
      one_box_check(3, 6..8)
    when 54..56, 63..65, 72..74
      one_box_check(6, 0..2)
    when 57..59, 66..68, 75..77
      one_box_check(6, 3..5)
    when 60..62, 69..71, 78..80
      one_box_check(6, 6..8)
    end
  end

  def solve_one(cell_index)
      total_possibilities = row_check(cell_index) + box_check(cell_index) + column_check(cell_index)
      occurrence_hash = {}
      total_possibilities.map {|num|
        if occurrence_hash.include?(num)
          occurrence_hash[num] += 1
        else
          occurrence_hash[num] = 1
        end}

      perfect_piece = occurrence_hash.select {|num, occurrence| occurrence == 3}.keys

      if perfect_piece.length == 1
         @board_arr[cell_index/9][cell_index%9] = perfect_piece.join('')
      end
  end

  def solve
    while @board_arr.flatten.include?('-')
      @board_arr.flatten.each.with_index {|cell, cell_index|
	      if cell == "-"
			solve_one(cell_index)
	      end}
    end
    @board_arr
  end

  # Returns a nicely formatted string representing the current state of the board
  def to_s
    solve.flatten.join('')
  end
end


# game = Sudoku.new('---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---')
# game.board


# puzzles = File.readlines('sudoku_puzzles.txt')


# puzzles.length.times do |num|
# 	Sudoku.new(puzzles[num].chomp).board
# 	p ''
# end


