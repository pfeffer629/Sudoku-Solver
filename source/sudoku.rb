class Sudoku
  attr_reader :board
  POSSIBLE_NUMBERS = ('1'..'9').to_a
  def initialize(board_string)
    @board = make_board(board_string)
  end

  def solve
    until finished?
      find_and_replace_empty
    end
  end

  def find_and_replace_empty
    @board.each_with_index do |row, row_index|
      row.each_with_index do |cell, column_index|
        if cell == '-' && one_solution?(row_index, column_index)
          insert_number(find_possible_numbers(row_index, column_index), row_index, column_index)
        end
      end
    end
  end

  def find_possible_numbers(row, column)
    POSSIBLE_NUMBERS - get_row(row) - get_column(column) - get_box(row, column)
  end

  def one_solution?(row_index, column_index)
    find_possible_numbers(row_index, column_index).length == 1
  end



  def insert_number(number, row, column)
    @board[row][column] = number.join
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

  def get_box(row, column)
    box_values = []
    start_box_row_value = row - row % 3
    start_box_column_value = column - column % 3
    (0..2).to_a.each do |row_offset|
      (0..2).to_a.each do |column_offset|
        box_values << @board[row_offset + start_box_row_value][column_offset + start_box_column_value]
      end
    end
    box_values
  end
  # Returns a nicely formatted string representing the current state of the board
  def print_board
    @board.each { |row| p row }
  end


end


game = Sudoku.new('6-873----2-----46-----6482--8---57-19--618--4-31----8-86-2---39-5----1--1--4562--')

# p game.get_row(1)
# p game.get_column(3)
# game.insert_number(game.find_possible_numbers(0,1), 0, 1)

# p game.find_possible_numbers(2,2)
game.solve
game.print_board
