class Sudoku
  def initialize(board_string)
    @board_string = board_string
    @board = board_string_to_board(board_string)
  end

  def solve
    while !solved?
      @board.map!.with_index do |row, outer_counter|
        row.map!.with_index do |cell, inner_counter|
          coordinates = [outer_counter, inner_counter]
          if empty?(cell)
            find_cell_solution(coordinates)
          else
            cell
          end
        end
      end
    # sleep(1)
    # p @board
    end
    # unsolved_board = ""
    # solved_square = (1..9)
    # unsolved_square = ""
    @board
  end

  def solved?
    @board.each do |row|
      row.each do |cell|
        return false if empty?(cell)
      end
    end
    true
  end

  def board
    @board_string
  end

  # Returns a nicely formatted string representing the current state of the board
  def to_s
    # p board
  end

  private

  def board_string_to_board(board_string)
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
    row_possiblities = check_row(coordinates)
    column_possiblities = check_column(coordinates)
    box_possiblities = check_box(coordinates)

    solution = row_possiblities & column_possiblities & box_possiblities

    return solution[0] if solution.length == 1
    "-" # default "no solution found" type thing
  end

  def check_row(coordinates, local_board = @board)
    possibilities = ("1".."9").to_a
    row = @board[coordinates[0]]
    row.each do |cell|
      if !empty?(cell)
        if possibilities.include?(cell)
          possibilities.delete(cell)
        end
      end
    end
    possibilities
  end

  def check_column(coordinates)
    possibilities = ("1".."9").to_a
    local_board = @board.transpose
    row = local_board[coordinates[1]]
    row.each do |cell|
      if !empty?(cell)
        if possibilities.include?(cell)
          possibilities.delete(cell)
        end
      end
    end
    possibilities
    # new_coordinates = [coordinates[1], coordinates[0]]
    # check_row(new_coordinates, @board.transpose)
  end

  def check_box(coordinates)
    possibilities = ("1".."9").to_a
    box_values = local_box(coordinates)
    box_values.each do |cell|
      if !empty?(cell)
        if possibilities.include?(cell)
          possibilities.delete(cell)
        end
      end
    end
    possibilities
    # TODO: "check string" should maybe be it's own method
  end

  def local_box(coordinates)
    # 1D array containing local box values based on coordinates
    return_array = []
    if ((0..2).include?(coordinates[0]) && (0..2).include?(coordinates[1])) # top left
      return build_box(0, 0)
    elsif ((0..2).include?(coordinates[0]) && (3..5).include?(coordinates[1])) # top middle
      return build_box(0,3)
    elsif ((0..2).include?(coordinates[0]) && (6..8).include?(coordinates[1])) # top right
      return build_box(0,6)
    elsif ((3..5).include?(coordinates[0]) && (0..2).include?(coordinates[1])) # middle left
      return build_box(3,0)
    elsif ((3..5).include?(coordinates[0]) && (3..5).include?(coordinates[1])) # middle
      return build_box(3,3)
    elsif ((3..5).include?(coordinates[0]) && (6..8).include?(coordinates[1])) # middle right
      return build_box(3,6)
    elsif ((6..8).include?(coordinates[0]) && (0..2).include?(coordinates[1])) # bottom left
      return build_box(6,0)
    elsif ((6..8).include?(coordinates[0]) && (3..5).include?(coordinates[1])) # bottom middle
      return build_box(6,3)
    elsif ((6..8).include?(coordinates[0]) && (6..8).include?(coordinates[1])) # bottom right
      return build_box(6,6)
    end
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


board = Sudoku.new('---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---'
)
p board.board
p board.solve



