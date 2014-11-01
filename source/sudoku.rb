class Sudoku
  attr_reader :rows, :columns, :board_string
  def initialize(board_string)
    @board_string = board_string
    @column_array = []
    @cluster_stage = []
    @cluster_array = []
    @taken_numbers = []
    @possibles = %w(1 2 3 4 5 6 7 8 9)
  end


  def split_into_cells
     @cells = @board_string.split('').each_slice(1).to_a
  end

  def create_rows #array of 9 arrays of 9 strings
    # @array_of_strings_rows = @board_string.scan(/.{1,9}/m)
    @rows = @board_string.split('').each_slice(9).to_a
  end

  def single_column(column)
    @rows.map { |rows| rows[column] }
  end

  def create_columns
    9.times do |i|
      @column_array << single_column(i)
    end
      @column_array
  end

  def create_clusters
      3.times do |i|
        @cluster_stage << @rows[i][0..2]
      end
      3.times do |i|
        @cluster_stage << @rows[i][3..5]
      end
      3.times do |i|
        @cluster_stage << @rows[i][6..9]
      end

    @cluster_array << @cluster_stage[0..2].reduce(:+)
    @cluster_array << @cluster_stage[3..5].reduce(:+)
    @cluster_array << @cluster_stage[6..8].reduce(:+)

   # @cluster_array[0].concat(@cluster_array[1]).concat(@cluster_array[2])
   # @cluster_array[3].concat(@cluster_array[4]).concat(@cluster_array[5])
   # @cluster_array[6].concat(@cluster_array[7]).concat(@cluster_array[8])

    3.times do |i|
        @cluster_stage << @rows[i+3][0..2]
      end
      3.times do |i|
        @cluster_stage << @rows[i+3][3..5]
      end
      3.times do |i|
        @cluster_stage << @rows[i+3][6..9]
      end

    @cluster_array << @cluster_stage[9..11].reduce(:+)
    @cluster_array << @cluster_stage[12..14].reduce(:+)
    @cluster_array << @cluster_stage[15..17].reduce(:+)


    3.times do |i|
        @cluster_stage << @rows[i+6][0..2]
      end
      3.times do |i|
        @cluster_stage << @rows[i+6][3..5]
      end
      3.times do |i|
        @cluster_stage << @rows[i+6][6..9]
      end

    @cluster_array << @cluster_stage[18..20].reduce(:+)
    @cluster_array << @cluster_stage[21..23].reduce(:+)
    @cluster_array << @cluster_stage[24..26].reduce(:+)

    @cluster_array

    end

  def find_empty_cells()

    @cell
    check_rows()
    check_columns()
    check_cluster()

  end

  def check_rows(row_index)
    @rows[row_index].each do |cell|
      @taken_numbers << cell if cell != '-'
    end
    @taken_numbers
  end

  def check_columns(column_index)
    @column_array[column_index].each do |cell|
      @taken_numbers << cell if cell != '-'
    end
    @taken_numbers
  end
  def check_cluster(cluster_index)
    @cluster_array[cluster_index].each do |cell|
      @taken_numbers << cell if cell != '-'
    end
    @taken_numbers
  end

  def check_possibles
    @nontaken_numbers = @possibles - @taken_numbers
  end

  def solve
  end

  def board
  end

  # Returns a nicely formatted string representing the current state of the board
  def to_s
  end
end


board1 = Sudoku.new('---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---')

 # puts "Test create_rows"
 board1.create_rows

# puts "Test create_columns"

board1.create_columns

# board1.create_columns
# puts "Test split_into_cells"
# p board1.split_into_cells

#access the first row
# p board1.create_rows

# # access the first three indeces of the first row
# # # p board1.create_rows[0](0..2) # => '---'
# puts "CLUSTERS OF THREE CELLS"
board1.create_clusters


puts "Testing Check Rows"
p board1.check_rows

puts "Testing Check Columns"
p board1.check_columns


puts "Testing Check Cluster"
p board1.check_cluster.uniq

puts "Testing non taken numbers"
p board1.check_possibles
