class Cell

  attr_accessor :possibilities, :position

  def initialize
    @possibilities = %w[1 2 3 4]
    @position = Array.new
  end

end

class Sudoku
  VALUES_TO_CHECK = [1,2,3,4]

  def initialize(board_string)
    @board_string = board_string
  end

  def solve
    self.check_cell
    empty_cell = Cell.new

    #check if all of the input types are integers in the array
  end

  def board
    @prep_board = @board_string.scan(/(.)(.)(.)(.)/)
  end

  #make a conditional that checks if "-" is still contained in the board
  def match_element(cell)
    self.check_row(cell)
    self.check_column(cell)
    p @prep_boardb
    p cell.possibilities
  end

  def check_for_empty_cell
    @prep_board.each_with_index do |row, row_index|
      row.each_with_index do |element, index|
        if element == "-"
          empty_cell = Cell.new
          empty_cell.position << row_index
          empty_cell.position << index
          row.delete_at(index)
          row.insert(index, empty_cell.possibilities)
          self.match_element(empty_cell)
        end
      end
    end
  end



  def check_row(cell)
    index = cell.position[0]
    row = @prep_board[index]
    cell.possibilities.delete_if {|element| row.include? element}
  end

  def check_column(cell)
    transposed_array = @prep_board.transpose
    # p transposed_array
    index = cell.position[1]
    column = transposed_array[index]
    cell.possibilities.delete_if {|element| column.include? element}
  end

  def check_box(cell)

  end

  # Returns a nicely formatted string representing the current state of the board
  def to_s
  end
end

four_by_four_board_row = "3-121-344-212-43"
four_by_four_board_column_and_board = "-234341-214--321"
board = '---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---'
sudoku_board = Sudoku.new(four_by_four_board_row)
p sudoku_board.board
sudoku_board.check_for_empty_cell


    # @prep_board.each do |row|
    #   row.each do |element|
    #     if element == "-"
    #       self.check_row
    #       self.check_column
    #       self.check_box


__END__
we can flaten the board and then iterate over the index, per four,
mini_board = []
@prep_board.each_with_index do |row, index|
  row.each_with_index |column, index|
  if index < 2 &&  < 2
    mini_board << row[0], row[1],


    mini_board << row[0] + x[1] }




    #board_array.each_slice(4)
    # return @board_string.split("") {|test|  @prep_board << test}
