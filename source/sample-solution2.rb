class Sudoku

  def initialize(board_string)
    @board = board_string.split("")
  end

  def solve
    until solved?
      board_copy = @board.dup
      @board.each_with_index do |value, index|
        if value == "-"
          remaining_possibilities = ("1".."9").to_a - get_row_col_box(index)
          if remaining_possibilities.size == 1
            @board[index] = remaining_possibilities.first
            display_while_running
          end
        end
      end
      return false if @board.join == board_copy.join
    end
    return @board.join
  end

  def solved?
    !@board.include?("-")
  end

  def get_row_col_box(index)
    get_row(index) + get_col(index) + get_box(index)
  end

  def get_row(index)
    starting_index = (index / 9) * 9
    @board[starting_index..(starting_index + 8)]
  end

  def get_col(index)
    starting_index = (index % 9)
    (0..8).map { |num| @board[starting_index + (num * 9)] }
  end

  def get_box(index)
    row_start_index = (index / 9 / 3) * 3
    col_start_index = (index % 9 / 3) * 3
    row_range = row_start_index..(row_start_index + 2)
    col_range = col_start_index..(col_start_index + 2)
    @board.each_slice(9).to_a[row_range].map { |row| row[col_range] }.flatten
  end

  def board
    @board
  end

  def display_while_running
    print "\e[2J"
    print "\e[H"
    puts self
    sleep 0.2
  end

  def to_s
    output= ""
    board = @board.dup
    9.times do
      9.times do
        output << board.shift
        output << " "
      end
      output << "\n"
    end
    output
  end



end

game = Sudoku.new("3-26-9--55--73----------9-----94----------1-9----57-6---85----6--------3-19-82-4-")
game.solve