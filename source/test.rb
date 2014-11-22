




string = '---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---'

board_array = @string.split("").each_slice(9).to_a

def check_each_row(board_array)
  @row_possibilities_array = []
  board_array.each do |row|
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
  board_array
  @row_possibilities_array
end

def check_each_column(board_array)
  @column_possibilities_array = []
  board_array.transpose.each do |row|
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
  board_array
  @column_possibilities_array
end


def merge_possibilities
  check_each_row(@board_array)
  check_each_column(@board_array)
  @merged_possibilities = []
  @row_possibilities_array.each_with_index do |row, index|
    @merged_possibilities << row & @column_possibilities_array[index]
  end
  @merged_possibilities
end





puts "test check_each_row"
puts ""
p check_each_row(board_array)
puts ""
puts "check_each_column"
puts ""
p check_each_column(board_array)
puts ""
puts "check_merge_possibilities"
p merge_possibilities




