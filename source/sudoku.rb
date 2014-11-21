class Sudoku

  def initialize(board_string ='---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---')
    @board_string = board_string
    @board_array = @board_string.split("").each_slice(9).to_a
  end


  def solve
  end

  def board

  end

  # Returns a nicely formatted string representing the current state of the board
  def to_s
  end

  def check_each_row
    @row_possibilities_array = []
    @board_array.each do |row|
      @row_possibilities = %w(1 2 3 4 5 6 7 8 9)
      row.map do |cell|
        if cell == "-" # if row.include?
          row.any? do |cell_value|
            if @row_possibilities.include?(cell_value)
              @row_possibilities.delete(cell_value)
            end
          end
        end
      end
      @row_possibilities_array << @row_possibilities
    end
    @board_array
    @row_possibilities_array
  end

  def check_each_column
    @column_possibilities_array = []
    @board_array.transpose.each do |row|
      @column_possibilities = %w(1 2 3 4 5 6 7 8 9)
      row.map do |cell|
        if cell == "-" # if row.include?
          row.any? do |cell_value|
            if @column_possibilities.include?(cell_value)
              @column_possibilities.delete(cell_value)
            end
          end
        end
      end
      @column_possibilities_array << @column_possibilities
    end
    @board_array
    @column_possibilities_array
  end

  def check_each_box
    @box_possibilities_array = []


  def merge_column_and_row_possibilities
    check_each_row
    check_each_column
    @merged_possibilities = []
    @row_possibilities_array.each_with_index do |row, index|
      puts counter
      @merged_possibilities << (row & @column_possibilities_array[index])

    end
    @merged_possibilities
  end



def get_boxes
  box1 = []
  box2 = []
  box3 = []
  box4 = []
  box5 = []

end


game = Sudoku.new

puts "test check_each_row"
puts ""
p game.check_each_row
puts ""
puts "check_each_column"
puts ""
p game.check_each_column
puts ""
puts "check_merge_column_and_row_possibilities"
p game.merge_column_and_row_possibilities









# board = '---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---'

# game = Sudoku.new(board)
# puts game

