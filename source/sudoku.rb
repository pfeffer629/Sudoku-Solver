=begin
1. create board as array, 9 by 9 nested array of string [[s,t,r,i,n,g],[...],...]
2. a method,retrun values of current row, select_row(index_num), select index of board.
3. a method to return values of a column, select_column(index_num),
  a transpose method.
4. a method that creates an array in which each element = each box
  using step method (example: (0..8).step(3) {|i| begin = 1 ; end = i + 2} ) <-- and then loop this
5. a method to return values of a box
6. create a clone of @board = test_board
7. at cell == '-' we use the THREE conditionals and find the difference between all integers (remaining: plausible answers)
  if difference.length == 1 then map it
  else continue HOWEVER .length == 0


=end


class Sudoku

  def initialize(board_string)
    @board = board_string.split(//).each_slice(9).to_a
    @nested_board = @board.map {|row| row.each_slice(3).to_a}
    create_box
    @cloned_board = @board.clone
  end

  def select_row(index)
    @row = @cloned_board[index]
  end

  def select_column(index)
    board_by_columns=@cloned_board.transpose
    @column=board_by_columns[index]
  end

  def select_box(box_number)
    @box = @board_by_box[box_number]

  end
  def create_box
    temp = []
    @board_by_box = []
    3.times do
      3.times do
        @nested_board[0..2].each{|row| temp << row.shift}
        @board_by_box << temp.flatten!
        temp = []
      end
      @nested_board.shift(3)
    end
  end

  def solve
    fill_row
    puts
  end


  def fill_row
    test_numbers=(1..9).to_a.map{|i| i.to_s}
    while @cloned_board.flatten.include?('-')
      @cloned_board.map!.with_index do |row, row_number|
          row.each_with_index do |cell, column_number|
            if cell == "-"
              if (test_numbers-@cloned_board[row_number]-select_column(column_number)-get_box(row_number,column_number)).size == 1
                row[column_number] = (test_numbers-@cloned_board[row_number]-select_column(column_number)-get_box(row_number,column_number))[0]
              end
            end
          end
      end
    end
    puts " this is clone board"
    @cloned_board.each{|i| p i}
  end

  def get_box(row_number,column_number)
    case
    when row_number<3 && column_number<3 then select_box(0)
    when row_number<3 && column_number<6 then select_box(1)
    when row_number<3 && column_number<9 then select_box(2)
    when row_number<6 && column_number<3 then select_box(3)
    when row_number<6 && column_number<6 then select_box(4)
    when row_number<6 && column_number<9 then select_box(5)
    when row_number<9 && column_number<3 then select_box(6)
    when row_number<9 && column_number<6 then select_box(7)
    when row_number<9 && column_number<9 then select_box(8)
    end
  end

  def board
    @board
  end

  # Returns a nicely formatted string representing the current state of the board
  def to_s
    @cloned_board.flatten.join
  end
end

#=======
# game=Sudoku.new("----------2-65-------18--4--9----6-4-3---57-------------------73------9----------")
# game.board.each{|row| p row}
# puts
# # puts
# # p game.select_row(0)
# # p game.select_column(0)
# p game.solve
# puts game




