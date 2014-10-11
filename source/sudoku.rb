class Sudoku
  BOX_ONE = ["00", "01", "02", "10", "11", "12", "20", "21", "22"]
  BOX_TWO = ["03", "04", "05", "13", "14", "15", "23", "24", "25"]
  BOX_THREE = ["06", "07", "08", "16", "17", "18", "26", "27", "28"]
  BOX_FOUR = ["30", "31", "32", "40", "41", "42", "50", "51", "52"]
  BOX_FIVE = ["33", "34", "35", "43", "44", "45", "53", "54", "55"]
  BOX_SIX = ["36", "37", "38", "46", "47", "48", "56", "57", "58"]
  BOX_SEVEN = ["60", "61", "62", "70", "71", "72", "80", "81", "82"]
  BOX_EIGHT = ["63", "64", "65", "73", "74", "75", "83", "84", "85"]
  BOX_NINE = ["66", "67", "68", "76", "77", "78", "86", "87", "88"]


  BOXES = [BOX_ONE, BOX_TWO, BOX_THREE,
           BOX_FOUR, BOX_FIVE, BOX_SIX,
           BOX_SEVEN, BOX_EIGHT, BOX_NINE]

  def initialize(board_string)
    # @board = '---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---'
    @board = board_string
    p @board = @board.split("").each_slice(9).to_a
  end

  def solve
    until !@board.flatten.include?("-")
      @board.each.with_index do |row, row_index|
        row.each.with_index do |element, column_index|
           if @board[row_index][column_index] == "-"
            current_blank = []
            current_blank << row_index
            current_blank << column_index
            numbers_from_box(current_blank)
            numbers_from_column(current_blank)
            numbers_from_row(current_blank)
            match =  find_possible_numbers
            if match.length == 1
                @board[row_index][column_index] = match[0].to_s
            end
          end
        end
      end
    end
    p @board
  end

  def board
  end

  # Returns a nicely formatted string representing the current state of the board
  def to_s
  end

  def find_first_blank
    blank_cell = []
    blank_cell=@board.each.with_index do |element, row|
      element.each.with_index do |location, column|
        if location == "-"
          blank_cell << row
          blank_cell << column
          return blank_cell
        end
      end
      return blank_cell
    end
  end

  def numbers_from_box(blank_cell)
    @box_values = []
    blank_cell_string = blank_cell.join("").to_s
    BOXES.each.with_index do |box, index|
      box.each.with_index do |value, index|
        if blank_cell_string == value
          box.each do |element|
            coordinates_x = element.split("").to_a[0]
            coordinates_y = element.split("").to_a[1]
            if @board[coordinates_x.to_i][coordinates_y.to_i] != "-"
              @box_values  << @board[coordinates_x.to_i][coordinates_y.to_i]
            end
          end
        end
      end
    end
    return @box_values
  end


  def numbers_from_row(blank_cell)
    coordinate = blank_cell[0]
    @row_values=[]
    @board[coordinate].each.with_index do |element, row|
        if element != "-"
          @row_values << element
        end
    end
    return @row_values
  end

 def numbers_from_column(blank_cell)
  coordinate = blank_cell[1]
  @column_values = []
  @board.each.with_index do |element, row|
    if @board[row][coordinate] != "-"
      @column_values << @board[row][coordinate]
    end
  end
  return @column_values
 end

  def find_possible_numbers
    @missings_values=(1..9).to_a - @column_values.join().split("").map(&:to_i) - @row_values.join().split("").map(&:to_i) - @box_values.join().split("").map(&:to_i)
  end
end ### END OF CLASS ####

# def assert
#   raise "ERROR" unless yield
# end






