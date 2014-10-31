class Sudoku
  def initialize(board_string)
    @board = board_string.chars.each_slice(9).to_a
  end

  def solve
    replace_empty_cells
    check_row

  end

  def replace_empty_cells
    # p @board
    @board.each do |row|
      # puts "inside row"
      row.map! do |cell|
        # puts "inside cell"
        if cell == "- " || cell == "-"
          ((1..9).to_a)
        elsif cell.is_a? String
            cell.ljust(1).to_i
        else
          cell
        end
      end
    end
    @board
  end


  def check_row
    eliminate = []
    @board.each do |row|
      row.each do

      end
    end
  end

  def board
  end

  # Returns a nicely formatted string representing the current state of the board
  def to_s
  formatted_board = @board.map do
                      |row| row.map! {|char| char.ljust(2) }
                      row.join
                    end
  puts formatted_board
    ""
  end
end


### Driver Test Code #######
board1 = Sudoku.new("---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---")
# puts board1
board1.replace_empty_cells
puts '-' * 20
board2 = Sudoku.new("4-5269781682571493197834562826195347374682915951743628519326874248957136763418259")
puts board2
board2.replace_empty_cells
p board2.solve
