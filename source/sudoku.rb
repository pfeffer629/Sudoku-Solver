=begin
* Sudocode *
Input: String of 81 integers and "-" / Char
Ouput: String of 81 integers

"---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---"

1) Find the first "-" Find the row where the "-" exist, list all
numbers that exist on that row.
2) Find the column where the "-" exist, list
all numbers that exist on that column.
3) Find the box where the "-" exist,
list all numbers that exist in that box.
4) Look at the numbers exist in row,
column and box. List numbers that are missing and those are possible solutions
for that "-"
5) If we have more than one solution, save those possiblities somewhere and move to next "-".
6) If we have found a unique solution, generate the new string
with the solution. Then move on to the next cell with a "-" for each cell

=end


class Sudoku
  def initialize(board_string)
    @board = board_string
  end

  def generate_row

    board_row = { 1 => @board[0..8].split(""), #array,
              2 => @board[9..17].split(""),
              3 => @board[18..26].split(""),
              4 => @board[27..35].split(""),
              5 => @board[36..44].split(""),
              6 => @board[45..53].split(""),
              7 => @board[54..62].split(""),
              8 => @board[63..71].split(""),
              9 => @board[72..80].split(""),
            }

    rows = (1..9).to_a.map do |row|
      Array.new(9) { board_row[row] }
    end

    @row_hash = Hash[rows.flatten(1).map.with_index{|set, idx| [idx, set]}]

  end

  def generate_col

    @board1= @board.split("").each_slice(9).to_a
    @board1 = @board1.transpose
    @board2 = @board1.flatten

    board_col = { 1 => @board2[0..8], #array,
              2 => @board2[9..17],
              3 => @board2[18..26],
              4 => @board2[27..35],
              5 => @board2[36..44],
              6 => @board2[45..53],
              7 => @board2[54..62],
              8 => @board2[63..71],
              9 => @board2[72..80],
            }

    cols = (1..9).to_a.map do |col|
      Array.new(9) { board_col[col] }
    end

    @col_hash = Hash[cols.flatten(1).map.with_index{|set, idx| [idx, set]}]

  end

  def generate_box

    row1 = @board[0..8].split("") #array
    row2 = @board[9..17].split("")
    row3 = @board[18..26].split("")
    row4 = @board[27..35].split("")
    row5 = @board[36..44].split("")
    row6 = @board[45..53].split("")
    row7 = @board[54..62].split("")
    row8 = @board[63..71].split("")
    row9 = @board[72..80].split("")

    box1 = row1[0..2] + row2[0..2] + row3[0..2]
    box2 = row1[3..5] + row2[3..5] + row3[3..5]
    box3 = row1[6..8] + row2[6..8] + row3[6..8]
    box4 = row4[0..2] + row5[0..2] + row6[0..2]
    box5 = row4[3..5] + row5[3..5] + row6[3..5]
    box6 = row4[6..8] + row5[6..8] + row6[6..8]
    box7 = row7[0..2] + row8[0..2] + row9[0..2]
    box8 = row7[3..5] + row8[3..5] + row9[3..5]
    box9 = row7[6..8] + row8[6..8] + row9[6..8]

    board_box = { 1 => box1, #array,
              2 => box2,
              3 => box3,
              4 => box4,
              5 => box5,
              6 => box6,
              7 => box7,
              8 => box8,
              9 => box9,
            }

    boxs = (1..9).to_a.map do |box|
      Array.new(9) { board_box[box] }
    end

    @box_hash = Hash[boxs.flatten(1).map.with_index{|set, idx| [idx, set]}]



  end

  def solve
    dash_index = []
    @board3 = @board.split("")
    @board3.each_with_index do |e,i|
      if e == "-"
       dash_index << i
      end
    end

    generate_row
    generate_col
    generate_box

    row = @row_hash[dash_index[0]]
    col = @col_hash[dash_index[0]]
    box = @box_hash[dash_index[0]]

    p result = [row,col,box].flatten.uniq
    full_number = ["-", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    p possiblities = full_number - result


  end

  def board
  end

  # Returns a nicely formatted string representing the current state of the board
  def to_s
  end
end

game = Sudoku.new("---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---")
game.solve
