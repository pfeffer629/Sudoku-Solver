class Sudoku
  attr_reader :board
  def initialize(board_string)
    @board = make_board(board_string)
    @possible_numbers = ('1'..'9').to_a
    # p @board
    # @columns = make_columns(@board)
  end

  def find_empty_cell
    @board.each_with_index do |row, row_index|
      row.each_with_index do |cell, column_index|
        if cell == '-'
          possible_numbers = find_possible_numbers(row_index, column_index)
          if possible_numbers.length == 1
            insert_number(possible_number.first, row_index, column_index)
          end
        end
      end
    end
  end

  def finished?
    @board.each do |row|
      row.each do |cell|
        return false if cell == '-'
      end
    end
    true
  end

  def make_board(sudoku_string)
    Array.new(9){sudoku_string.slice!(0...9).split('')}
  end

  def get_row(row)
    @board[row]
  end

  def get_column(column)
    @board.map { |row| row[column] }
  end

  def find_possible_numbers(row, column)
    @possible_numbers - get_row(0) - get_column(0)
  end

  def board
  end

  # Returns a nicely formatted string representing the current state of the board
  def print_board
    @board.each { |row| p row }
  end
end


game = Sudoku.new('---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---')
game.print_board
# p game.get_row(1)
# p game.get_column(3)
p game.solve
