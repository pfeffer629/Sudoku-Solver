=begin
cell = individual element of board
quadrant = 3x3 box of cells
row = complete row
column = complete vertical column
sub-row = three cells of row
board = large array of nested array rows

initialize board
  1.converting the board string into data structure of arrays
      slice string at every 9th character
      push elements by row into larger board array
create placeholder array

  2. Empty_cell method
  iterate over board array
      by row
        by element
          looking for the dash string
  when finds empty return the index of that row also the element index within that row
        use that row index in
  3. horizontal push method
              to push all elements in that row to a place holder array
  4. vertical push method
        transposes board
        use empty element index to find column to determine row to iterate over
  5.



  2.Horizontal_selector method

TO DO LIST:
make a quadrant method separates the board into nine quadrant
nine arrays inside an array
2. use column and row index to determine what quadrant to use to interate over for final group to
add to the compile
3. add the missing values to the board array.
5. make sure this works for multiple missing values
        1.loop back around and also create solved? method
        2. remove the solved cells coodinates from the all empty array.



=end
class Sudoku
  attr_reader :all_empty_cell_coords
  attr_accessor :quadrant_1, :quadrant_2, :quadrant_3, :quadrant_4, :quadrant_5, :quadrant_6, :quadrant_7, :quadrant_8, :quadrant_9

  def initialize(board_string)
    @board = []
    @all_empty_cell_coords = []
    @current_empty_cell_coords = []
    @current_unique_vals = []
    @compiled_values_array = []
    @quadrant_1 = []
    @quadrant_2 = []
    @quadrant_3 = []
    @quadrant_4 = []
    @quadrant_5 = []
    @quadrant_6 = []
    @quadrant_7 = []
    @quadrant_8 = []
    @quadrant_9 = []
    create_board(board_string)
    find_empty_cell_coords
    cycle_through_empty_cells
    # @current_empty_cell_coords = [0,0]
  end

  # Takes board_string and slices it every nine chars and splits into an array
  def create_board board_string
    counter = 0
    while counter < 9
      @board << board_string.slice!(0,9).split(//)
      counter +=1
    end
  end

  # Iterates over board by row and then by element searching for "-"
  # When it locates "-" it pushes those coords to @all_empty_cell_coords array
  def find_empty_cell_coords
    @board.each_with_index do |row, row_index|
      row.each_with_index do |element_value, column_index|
        if element_value == "-"
          @all_empty_cell_coords.push({row_index: row_index, column_index: column_index})
        end
      end
    end
  end

  def cycle_through_empty_cells
    # @all_empty_cell_coords.cycle do |empty_coord_hash|
    #   break out of cycle somehow...
    # end
    fill_empty_cell(0,1)
  end

  def fill_empty_cell row_index, column_index
    compile_all_values(row_index,column_index)
    if @current_unique_vals.size == 1
      p "We have a match!"
      p @board[row_index][column_index] = @current_unique_vals[0].to_s
    end
  end

  # Higher level class that runs row,col and quadrant methods
  # Eventually pushes all found values into one larger array where a missing digit will be located
  def compile_all_values row_index, column_index
    p "compile #{row_index} #{column_index}"
    current_row_vals(row_index)
    current_col_vals(column_index)
    populate_quadrant_array
    current_quad_vals(row_index,column_index)
    current_unique_vals
  end

  # Based on a row_index, pushes all values that are not "-" from row to our @compiled_values_array
  def current_row_vals row_index
    current_row_vals_array = []
    current_row_vals_array.push(@board[row_index]).flatten!
    result_values = current_row_vals_array.select do |element_value|
      element_value != "-"
    end
    @compiled_values_array << result_values
  end

  # Based on a col_index, pushes all values that are not "-" from column to our @compiled_values_array
  def current_col_vals column_index
    transposed_board = @board.transpose
    current_col_vals_array = []
    current_col_vals_array.push(transposed_board[column_index]).flatten!
    result_column_values = current_col_vals_array.select do |element_value|
      element_value != "-"
    end
    @compiled_values_array << result_column_values
  end

  def populate_quadrant_array
    @board.each_with_index do |row, row_index|
      row.each_with_index do |element_value, column_index|
        if row_index.between?(0,2) && column_index.between?(0,2)
          if element_value != "-"
          @quadrant_1 << element_value
          end
        elsif row_index.between?(0,2) && column_index.between?(3,5)
          if element_value != "-"
          @quadrant_2 << element_value
          end
        elsif row_index.between?(0,2) && column_index.between?(6,8)
          if element_value != "-"
          @quadrant_3 << element_value
          end
        elsif row_index.between?(3,5) && column_index.between?(0,2)
          if element_value != "-"
          @quadrant_4 << element_value
          end
        elsif row_index.between?(3,5) && column_index.between?(3,5)
          if element_value != "-"
          @quadrant_5 << element_value
          end
        elsif row_index.between?(3,5) && column_index.between?(6,8)
          if element_value != "-"
          @quadrant_6 << element_value
          end
        elsif row_index.between?(6,8) && column_index.between?(0,2)
          if element_value != "-"
          @quadrant_7 << element_value
          end
        elsif row_index.between?(6,8) && column_index.between?(3,5)
          if element_value != "-"
          @quadrant_8 << element_value
          end
        elsif row_index.between?(6,8) && column_index.between?(6,8)
          if element_value != "-"
          @quadrant_9 << element_value
          end
        end
      end
    end
  end

  def current_quad_vals row_index, column_index
    if row_index.between?(0,2) && column_index.between?(0,2)
      @compiled_values_array << @quadrant_1
    elsif row_index.between?(0,2) && column_index.between?(3,5)
      @compiled_values_array << @quadrant_2
    elsif row_index.between?(0,2) && column_index.between?(6,8)
      @compiled_values_array << @quadrant_3
    elsif row_index.between?(3,5) && column_index.between?(0,2)
      @compiled_values_array << @quadrant_4
    elsif row_index.between?(3,5) && column_index.between?(3,5)
      @compiled_values_array << @quadrant_5
    elsif row_index.between?(3,5) && column_index.between?(6,8)
      @compiled_values_array << @quadrant_6
    elsif row_index.between?(6,8) && column_index.between?(0,2)
      @compiled_values_array << @quadrant_7
    elsif row_index.between?(6,8) && column_index.between?(3,5)
      @compiled_values_array << @quadrant_8
    elsif row_index.between?(6,8) && column_index.between?(6,8)
      @compiled_values_array << @quadrant_9
    end
  end

  # Finds unique values from @compiled_values_array and finds the missing number
  def current_unique_vals
    sudoku_range = (1..9).to_a
    current_vals = @compiled_values_array.flatten.uniq.map {|element_value| element_value.to_i }
    p @current_unique_vals.replace(sudoku_range - current_vals)
  end



  def solve
  end

  # Returns a nicely formatted string representing the current state of the board
  def to_s
    puts "----Sudoku Board---"
    @board.each do |row|
      puts row.join.gsub(//, " ")
    end
  end
end

game = Sudoku.new("4-5269781682571493197834562826195347374682915951743628519326874248957136763418259")
game.to_s
# p game.quadrant_1
# game = Sudoku.new("4-526-781682571493197834562826195347374682915951743628519326874248957136763418259")
# p game.all_empty_cell_coords

# does board create work?
# does all empty cells work?
# loop through?
# does current_row_vals work?
# cols?
# boxes?

# p game.current_empty_cell_coords == [0,1]
# p game.current_row_vals
