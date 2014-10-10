POSSIBLE_VALUES = [1,2,3,4,5,6,7,8,9]


class Sudoku
  def initialize(board_string)
    @box_array = []
    # @box_side_length = 3

    @current_column = 0
    @current_row = 0
    @board_array = board_string.split('').each_slice(9).to_a
    @board_array.each{ |row| row.map!{ |element| element == '-' ? element : element.to_i }}
    @box_side_length = Math.sqrt(@board_array[0].length).to_i
    return @board_array
  end

  def solve
    while empty_cells?

      @board_array.each_with_index do |row, index|
        if row.include?('-')
          @current_row = index
          row.each do |element, index|
            @current_column = index
            if element == '-'
              element = missing_value
            else
              next
            end
          end
        else
          next
        end
      end
    end
  end

  def missing_value
    # row_values = get_row_values
    # col_values  = get_col_values
    # box = get_box_values
    combined_row_col_box = get_box_values + get_col_values + get_row_values
    combined_row_col_box.delete('-')
    unique = combined_row_col_box.uniq!

    if unique.length == 8
      return POSSIBLE_VALUES - unique
    else
      return false
    end
  end

  def empty_cells?
    @board_array.flatten(1).include?('-')
  end

   # return array with values of current row
  def get_row_values
    @board_array[@current_row]
  end

  # return array with values of current col
  def get_col_values
    @board_array.transpose[@current_row]
  end

  def get_box_row_coordinate
    # @box_row = @current_row    / @box_side_length
    # @box_col = @current_column / @box_side_length
    @box_row = 0
    @box_col = 0
  end

  def get_box_values
    get_box_row_coordinate
    @board_array.each_with_index do |row, row_index|
      if row_index>= @box_row * @box_side_length && row_index < @box_side_length+ @box_row * @box_side_length
        row.each_with_index do |element, col_index|
          if col_index >= @box_col *@box_side_length && col_index < @box_side_length + @box_col * @box_side_length
            @box_array << element
          end
        end
      end
    end
    return @box_array
  end


  def board
  end

  # Returns a nicely formatted string representing the current state of the board
  def to_s
    @board_view = @board_array.each { |row| row << "\n" }.join(' ')
  end
end


############### Test Code
def assert
  raise "Assertion failed" unless yield
end

sudoku = Sudoku.new("4-5269781682571493197834562826195347374682915951743628519326874248957136763418259")
puts sudoku
sudoku.solve
# puts sudoku

# assert { sudoku.get_row_values == [4,'-',5,2,6,9,7,8,1] }
# assert { sudoku.get_col_values == [4,6,1,8,3,9,5,2,7] }
# assert { sudoku.empty_cells? == true }
# # assert { sudoku.test_print_box == [4,'-',5,6,8,2,1,9,7] }  #@(row 0,0)
# assert { sudoku.test_print_box == [4,'-',5,6,8,2,1,9,7] }  #@(row 0,1)
# assert { sudoku.test_print_box == [8,2,6,3,8,4,9,5,1] }  #@(row 4,0)  fails
# assert { sudoku.test_print_box == [2,6,9,5,7,1,8,3,4] }  #@(row 0,4)
# p sudoku.get_box_values

puts "Great Success!"
