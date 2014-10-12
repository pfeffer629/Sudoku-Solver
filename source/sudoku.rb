# subract any possibilities
require 'debugger'

class Sudoku
  attr_reader :boxes
  def initialize(board_string)
    @board = board_string.split('')
    @boxes = Array.new(board_string.length**(0.5)) {[]}
    @number_coordinates = []
    @possibilities = []
    @new_square_root = @board.length**(0.5)
  end

  def board_string_to_array
    string_length = @board.length
    square_root_length = string_length**(0.5)
    @board = Array.new(square_root_length) { @board.shift(square_root_length)}
    return @board
  end

  def board_string_to_boxes
    double_sr = (@board.length**(0.5)).to_i # this is 3
    index_array = (Array.new(1) {(0..double_sr-1).to_a}).flatten!
    counter = double_sr-1
    outer_counter = 0
    second_counter = 0
    copy_of_board = @board.flatten
    while second_counter < double_sr
      while outer_counter < double_sr
        index_array.each do |x|
          @boxes[x] << copy_of_board.shift(double_sr)
          @boxes[x].flatten!
        end
        outer_counter += 1
      end
        index_array.map! {|x| x += double_sr}
        second_counter += 1
        outer_counter = 0
    end
    return @boxes
  end



  def is_empty?
    if @board.flatten.include?('-')
      return true
    else
      return false
    end
  end


  def prepare_board
    board_string_to_array
    board_string_to_boxes
  end

  def check_row(coordinates)
    @possibilities.clear
   # values = %w/1 2 3 4/
    values = %w/1 2 3 4 5 6 7 8 9/
    values.each do |x|
     if @board[coordinates.first].include?(x)
        @possibilities << x
        # p @possibilities
      end
    end
  end

  def check_column(coordinates)
    column_array = @board.transpose
    #values = %w/1 2 3 4/
    values = %w/1 2 3 4 5 6 7 8 9/
    values.each do |x|
      if column_array[coordinates.last].include?(x)
        @possibilities << x
      end
    end
  end

  def check_box(coordinates)
    #values = %w/1 2 3 4/
    values = %w/1 2 3 4 5 6 7 8 9/
    outer_array = [coordinates.first / (@new_square_root**(0.5)).to_i, coordinates.last / (@new_square_root**(0.5)).to_i]
    # box_coordinate_pairs = [[0, [0,0]], [1, [0,1]],
    #                         [2, [1,0]], [3, [1,1]]]
    box_coordinate_pairs = [[0, [0,0]], [1, [0,1]], [2, [0,2]],
                            [3, [1,0]], [4, [1,1]], [5, [1,2]],
                            [6, [2,0]], [7, [2,1]], [8, [2,2]]]
    counter = 0
    while counter < box_coordinate_pairs.length
     if box_coordinate_pairs[counter].last == outer_array
      box_index = counter
     end
      counter += 1
    end
    values.each do |x|
      if @boxes[box_index].include?(x)
          @possibilities << x
      end
    end
  end

  def solve
    prepare_board
    # until is_empty? == false
    100.times do
      @board.each do |row|
        row.each do |element|
           #
          if element == '-'
            @number_coordinates = [@board.index(row), row.index(element)]
            check_row(@number_coordinates)
            check_column(@number_coordinates)
            check_box(@number_coordinates)
            unique_options = @possibilities.uniq
            if unique_options.length == 8
              values = %w/1 2 3 4 5 6 7 8 9/
              unique_options = values - unique_options
              @board[@number_coordinates.first][@number_coordinates.last] = unique_options.first
              board_string_to_boxes
            end
          end
        end
      end
    end
  end

  # returns current state of board as unformatted string
  def board
  end

  # Returns a nicely formatted string representing the current state of the board
  def to_s
  end
end

game = Sudoku.new("---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---")
# [[1,2,5,6], [3,4,7,8]]
#game = Sudoku.new("425269781682571493197834562826195347374682915951743628519326874248957136763418259")
#game = Sudoku.new("132424133-41413-")
game.solve
# game.board_string_to_array
# game.board_string_to_boxes
# game.prepare_board
# game.check_box([5,4])




