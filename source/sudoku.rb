class Sudoku
  attr_reader :boxes
  def initialize(board_string)
    @board = board_string
    @boxes = Array.new(board_string.length**(0.5)) {[]}
    @number_coordinates = []
    @possibilities = []
    @new_square_root = @board.length**(0.5)
  end

  def board_string_to_boxes
    square_root = @board.length**(0.5)
    index_array = (Array.new(1) {(0..square_root**(0.5)-1).to_a}).flatten!
    copy_of_string = @board.split('')
    counter = square_root**(0.5)-1
    outer_counter = 0

    while outer_counter < square_root**(0.5)
      while @boxes[counter].length < square_root
        index_array.each do |index|
          @boxes[index] << copy_of_string.shift(square_root**(0.5))
          @boxes[index].flatten!
        end
      end
      counter += square_root**(0.5)
      index_array.map! { |x| x += square_root**(0.5)}
      outer_counter += 1
    end
    p @boxes
  end

  def board_string_to_array
    string_length = @board.length
    square_root_length = string_length**(0.5)
    @board = @board.split('')
    @board = Array.new(square_root_length) { @board.shift(square_root_length)}
    return @board
  end

  def is_empty?
    @board.each do |row|
      row.each do |column|
        if column == '-'
          return true
        end
      end
    end
  end

  def empty_square_coordinates
    @number_coordinates = []
    @board.each do |row|
      row.each do |column|
        if column == '-'
          @number_coordinates << [@board.index(row), row.index(column)]
          @number_coordinates.flatten!
        end
      end
    end
  end

  def prepare_board
    board_string_to_boxes
    @board = board_string_to_array
    is_empty?
    empty_square_coordinates
  end

  def check_row(coordinates)
    @possibilities = []
    values = %w/1 2 3 4 5 6 7 8 9/
    values.each do |x|
     unless @board[coordinates.first].include?(x)
        @possibilities << x
      end
    end
  end

  def check_column(coordinates)
    column_array = @board.transpose
    values = %w/1 2 3 4 5 6 7 8 9/
    values.each do |x|
      unless column_array[coordinates.last].include?(x)
        unless @possibilities.include?(x)
          @possibilities << x
        end
      end
    end
  end

  def check_box(coordinates)
    values = %w/1 2 3 4 5 6 7 8 9/
    outer_array = [coordinates.first / (@new_square_root**(0.5)).to_i, coordinates.last / (@new_square_root**(0.5)).to_i]
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
      unless @boxes[box_index].include?(x)
        unless @possibilities.include?(x)
          @possibilities << x
        end
      end
    end
  end

  def fill_empty_space
    p @possibilities.length
    if @possibilities.length == 1
      p "POSSIBISLDF#{@possibilities}"
      @board[@number_coordinates.first][@number_coordinates.last] = @possibilities.first
    end
  end

  # returns a formatted string wihtout dashes (solved)
  def solve
    prepare_board
    # if is_empty? == true
    #   check_row(@number_coordinates)
    # end
      # check_column(@number_coordinates)
    @board.each do |row|
      row.each do |column|
        check_box([@board.index(row), row.index(column)])
        check_column([@board.index(row), row.index(column)])
        check_box([@board.index(row), row.index(column)])
        fill_empty_space
      end
    end
    p @board
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

game.solve



