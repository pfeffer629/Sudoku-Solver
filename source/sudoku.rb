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
    @column_possibilities_array
  end

  def get_boxes
    box_1 = []
    box_2 = []
    box_3 = []
    box_4 = []
    box_5 = []
    box_6 = []
    box_7 = []
    box_8 = []
    box_9 = []
    @board_array.each_with_index do |row, row_index|
      row.each_with_index do |cell, cell_index|
        if cell_index < 3 && row_index < 3
          box_1 << cell
        elsif cell_index < 6 && row_index < 3
          box_2 << cell
        elsif cell_index < 9 && row_index < 3
          box_3 << cell
        elsif cell_index < 3 && row_index < 6
          box_4 << cell
        elsif cell_index < 6 && row_index < 6
          box_5 << cell
        elsif cell_index < 9 && row_index < 6
          box_6 << cell
        elsif cell_index < 3 && row_index < 9
          box_7 << cell
        elsif cell_index < 6 && row_index < 9
          box_8 << cell
        else cell_index < 9 && row_index < 9
          box_9 << cell
        end
      end
    end
    box_1
    box_2
    box_3
    box_4
    box_5
    box_6
    box_7
    box_8
    box_9
   @box_array = []
    @box_array << box_1 << box_2 << box_3 << box_4 << box_5 << box_6 << box_7 << box_8 << box_9
  end

  def check_each_box
    get_boxes
    @box_possibilities_array = []
    @box_array.each do |box|
      @box_possibilities = %w(1 2 3 4 5 6 7 8 9)
      box.map do |cell|
        if cell == "-"
          box.any? do |cell_value|
            if @box_possibilities.include?(cell_value)
              @box_possibilities.delete(cell_value)
            end
          end
        end
      end
      @box_possibilities_array << @box_possibilities
    end
    @box_possibilities_array
  end

  def merge_column_and_row_and_box_possibilities
    # check_each_row
    # check_each_column
    # check_each_box
    @merged_possibilities = []
    @row_possibilities_array.each_with_index do |row, index|
      @merged_possibilities << (row & @column_possibilities_array[index] & @box_possibilities_array[index])
    end
    @merged_possibilities
  end

end




game = Sudoku.new

puts "check_each_row"
puts ""
p game.check_each_row
puts ""
puts "check_each_column"
puts ""
p game.check_each_column
puts ""
puts "check_each_box"
puts ""
p game.check_each_box
puts ""
puts "test merge all possibilities"
puts ""
p game.merge_column_and_row_and_box_possibilities









# board = '---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---'

# game = Sudoku.new(board)
# puts game

