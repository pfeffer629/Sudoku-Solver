class Sudoku
  attr_reader :board
  POSSIBLE_NUMBERS = ('1'..'9').to_a
  def initialize(board_string)
    @board = make_board(board_string)
    # p @board
    # @columns = make_columns(@board)
  end

  def find_and_replace_empties
    @board.each_with_index do |row, row_index|
      row.each_with_index do |cell, column_index|
        if cell == '-'
          viable_numbers = find_possible_numbers(row_index, column_index)
          if viable_numbers.length == 1
            insert_number(viable_numbers, row_index, column_index)
          end
        end
      end
    end
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

  def find_possible_numbers(row, column)
    POSSIBLE_NUMBERS - get_row(row) - get_column(column) - get_box(row, column)
  end

  def get_box(row, column)
    result = []
    if row.between?(0,2) && column.between?(0,2)
      for i in 0..2
        for j in 0..2
        result << @board[i][j]
        end
      end
    elsif row.between?(0,2) && column.between?(3,5)
      for i in 0..2
        for j in 3..5
        result << @board[i][j]
        end
      end
    elsif row.between?(0,2) && column.between?(6,8)
      for i in 0..2
        for j in 6..8
        result << @board[i][j]
        end
      end
    elsif row.between?(3,5) && column.between?(0,2)
      for i in 3..5
        for j in 0..2
        result << @board[i][j]
        end
      end
    elsif row.between?(3,5) && column.between?(3,5)
      for i in 3..5
        for j in 3..5
        result << @board[i][j]
        end
      end
    elsif row.between?(3,5) && column.between?(6,8)
      for i in 3..5
        for j in 6..8
        result << @board[i][j]
        end
      end
    elsif row.between?(6,8) && column.between?(0,2)
      for i in 6..8
        for j in 0..2
        result << @board[i][j]
        end
      end
    elsif row.between?(6,8) && column.between?(3,5)
      for i in 6..8
        for j in 3..5
        result << @board[i][j]
        end
      end
    elsif row.between?(6,8) && column.between?(6,8)
      for i in 6..8
        for j in 6..8
        result << @board[i][j]
        end
      end
    end
    result
  end


  # Returns a nicely formatted string representing the current state of the board
  def print_board
    @board.each { |row| p row }
  end
end


game = Sudoku.new('--5-3--819-285--6-6----4-5---74-283-34976---5--83--49-15--87--2-9----6---26-495-3')

# p game.get_row(1)
# p game.get_column(3)
# game.insert_number(game.find_possible_numbers(0,1), 0, 1)

# p game.find_possible_numbers(2,2)
until game.finished?
  game.find_and_replace_empties
end
game.print_board
