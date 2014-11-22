# Pseudocode

# I. Set up the board
# => i. Use #each_slice to separate every row into a separate array

# II. Find all possibilities
# => i. Create an array of numbers 1..9

# III. Find empty cell
# => i. Check every row for a "-"

# IV. Look at related sets
# => i. #find_row
# => => 1. Look at empty cell's array
# => => 2. Find every filled cell's number in found row.
# => ii. #find_column
# => => 1. Look at index of empty cell
# => => 2. Find every filled cell in all rows with the same index as empty cell
# => iii. #find_box
# => => 1. #find_box_row_coordinate
# => => => i. empty array's row % 3. If 0, look at row, row +1, row +2
# => => => ii. If 1, look at row -1, row, row +1
# => => => iii. If 2, look at row -2, row -1, row
# => => 1. #find_box_column_coordinate
# => => => i. empty array's column % 3. If 0, look at column, column +1, column +2
# => => => ii. If 1, look at column -1, column, column +1
# => => => iii. If 2, look at column -2, column -1, column
# => => 2. Find every filled cell's from find_box number in found box.
# => iv. #find_filled_cells
# => => 1. Gather all found filled cell numbers from #find_row, #find_column and #find_box

# V. Find possible solutions for empty cell
# => i. #find_possible_solutions
# => => 1. Find numbers that were not found in #find_filled_cells
# => => 2. Replace "-" with #find_possible_solution if there is only one

# VI. Check if all cells are filled.
# VII. Repeat


class Sudoku

  def initialize(board_string)
    @board_string = board_string
    @board_array = []
    @board_string.split("").each_slice(9){|a| @board_array << a}
    @possible_solutions = (1..9).to_a

    @empty_cell = []
    @found_row = []
    @found_column = []
    @found_box_row_coordinate = []
    @found_box_column_coordinate = []
    @box_cells = []
    @found_filled_cells = []


  end

  def print_board
    @board_array.each do |row|
        p row
      end
  end

  def find_empty_cell
    if @board_array.include?("-") == false
      @board_array.gsub! "%", "-"
    end
    @board_array.each_with_index do |row, row_index|
      row.each_with_index do |column, column_index|
        if column == "-"
          @empty_cell << row_index
          @empty_cell << column_index
          column.gsub! "-", "%"
        end
      end
    end
  end

  def find_row
    @found_row << @board_array[@empty_cell[0]]
    @found_row.flatten!
  end

  def find_column
    @found_column << @board_array.transpose[@empty_cell[1]]
    @found_column.flatten!
  end

  def find_box
    find_box_row_coordinate
    find_box_column_coordinate

    box_coordinates = []

    @found_box_row_coordinate.each do |row_coordinate|
      @found_box_column_coordinate.each do |column_coordinate|
        box_coordinates << row_coordinate
        box_coordinates << column_coordinate
      end
      box_coordinates.each_slice(2) {|a| @box_cells << a}
    end
    @box_cells
  end

  def find_box_row_coordinate
    if @empty_cell[0] % 3 == 0
      @found_box_row_coordinate << @empty_cell[0] << @empty_cell[0] + 1 << @empty_cell[0] + 2
    elsif @board_array[@empty_cell[0]] % 3 == 1
      @found_box_row_coordinate << [@empty_cell[0] - 1 << @empty_cell[0] << @empty_cell[0] + 1]
    elsif @empty_cell[0] % 3 == 2
      @found_box_row_coordinate << [@empty_cell[0] -2 << @empty_cell[0] - 1 << @empty_cell[0]]
    end
  end

  def find_box_column_coordinate
    if @empty_cell[0] % 3 == 0
      @found_box_column_coordinate << @empty_cell[1] << @empty_cell[1] + 1 << @empty_cell[1] + 2
    elsif @board_array[@empty_cell[0]] % 3 == 1
      @found_box_column_coordinate << @empty_cell[1] - 1 << @empty_cell[1] << @empty_cell[1] + 1
    elsif @empty_cell[0] % 3 == 2
      @found_box_column_coordinate << @empty_cell[1] -2 << @empty_cell[1] - 1 << @empty_cell[1]
    end
  end

  def find_filled_cells
    find_row
    find_column
    find_box
    @found_row.each do |num|
      if num != "-"
        @found_filled_cells << num
      end
    end

    @found_column.each do |num|
      if num != "-"
        @found_filled_cells << num
      end
    end

    @box_cells.each do |coordinate|
      if @board_array[coordinate[0]][coordinate[1]] != "-"
         @found_filled_cells << @board_array[coordinate[0]][coordinate[1]]
      end
    end
     @found_filled_cells.sort.uniq
  end

  def find_solution
    find_empty_cell
    find_filled_cells
    solution = @possible_solutions.map {|i| i.to_s} - @found_filled_cells
    if solution.one?
      @board_array[@empty_cell[0]][@empty_cell[1]].gsub! "%", solution[0].to_s
    end
  end

  def solve
    while @board_array.flatten.include?("-")
       find_solution
    end
  end

  def board
  end

  # Returns a nicely formatted string representing the current state of the board
  def to_s
  end
end

doku = Sudoku.new('---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---')
# doku = Sudoku.new('-12345678------------------------------------------------------------------------')
doku.print_board
# doku.find_empty_cell
# p doku.find_empty_cell
# doku.find_row
# doku.find_column
# doku.find_box
doku.find_solution
doku.print_board
