require 'benchmark'
class Sudoku
  def initialize(board_string)
    @board_string = board_string
    @board = board_string_to_board(board_string)
  end

  def solve
    has_found_empty_cell = true
    while has_found_empty_cell
      has_found_empty_cell = false

      @board.map!.with_index do |row, outer_counter|

        row.map.with_index do |cell, inner_counter|
          coordinates = [outer_counter, inner_counter] # Equivalent to (y, x)

          if empty?(cell)
            has_found_empty_cell = true
            find_cell_solution(coordinates)
          else
            cell
          end
        end
      end
    end
    @board
  end

  def board
    @board_string
  end

  # Not gonna lie, I kind of ran out of steam here.
  def to_s
    @board.to_s
  end

  private

  def board_string_to_board(board_string)
    # I have no doubt that there is a much better way to do this.
    formatted_board = []
    9.times do |counter|
      starting_position = counter * 9
      ending_position = starting_position + 8
      formatted_board << board_string[starting_position..ending_position].split("")
    end
    formatted_board
  end

  def empty?(cell)
    return true if cell == "-"
    false
  end

  def find_cell_solution(coordinates)
    solution = check_row(coordinates) & check_column(coordinates) & check_box(coordinates)

    if solution.length == 1
      solution.first
    else
      "-" # only gets returned if no unique solution is found
    end
  end


  def check_row(coordinates)
    row = @board[coordinates[0]]
    find_possibilities_in_row(row)
  end

  def check_column(coordinates)
    row = @board.transpose[coordinates[1]]
    find_possibilities_in_row(row)
  end

  def check_box(coordinates)
    box_values = local_box(coordinates)
    find_possibilities_in_row(box_values)
  end

  def find_possibilities_in_row(row)
    ("1".."9").to_a - row
  end

  # returns 1D array containing local box values based on coordinates
  # which handily matches the format required by the find_possibilities_in_row method
  # Could probably benefit from some sort of floor method rather than the confusing
  # (x / 3) * 3 thing.
  def local_box(coordinates)
    build_box((coordinates[0]/3)*3, (coordinates[1]/3)*3)
  end

  def build_box(x, y)
      [@board[x][y],
      @board[x+1][y],
      @board[x+2][y],
      @board[x][y+1],
      @board[x+1][y+1],
      @board[x+2][y+1],
      @board[x][y+2],
      @board[x+1][y+2],
      @board[x+2][y+2]]
  end



end

# Admire our exhaustive test suite:

board = Sudoku.new('---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---'
)
p board.board
p board.solve

board = Sudoku.new('--5-3--819-285--6-6----4-5---74-283-34976---5--83--49-15--87--2-9----6---26-495-3'
)
p board.board
p board.solve
