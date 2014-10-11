class Sudoku

  attr_reader :row, :column, :grid, :board_string_arr, :board_string, :cell_hash, :cell_counter, :changed_var
  def initialize(board_string)
    @board_string = board_string
    @board_string_arr = @board_string.split("")
    @grid = {}
    @row = {}
    @column = {}
    @possible_val = []
    @cell_counter = 0
    @cell_hash = {}
    @grid_arr = [[0,1,2,9,10,11,18,19,20],[3,4,5,12,13,14,21,22,23],[6,7,8,15,16,17,24,25,26],[27,28,29,36,37,38,45,46,47],[30,31,32,39,40,41,48,49,50],[33,34,35,42,43,44,51,52,53],[54,55,56,63,64,65,72,73,74],[57,58,59,66,67,68,75,76,77],[60,61,62,69,70,71,78,79,80]]
    @changed_var = true
  end

  def create_collections
    @row = @board_string_arr.each_slice(9).to_a
    @column = @row.transpose
    @grid[0]= (@board_string_arr[0]+@board_string_arr[1]+@board_string_arr[2]+@board_string_arr[9]+@board_string_arr[10]+@board_string_arr[11]+@board_string_arr[18]+@board_string_arr[19]+@board_string_arr[20]).split("")
    @grid[1]= (@board_string_arr[3]+@board_string_arr[4]+@board_string_arr[5]+@board_string_arr[12]+@board_string_arr[13]+@board_string_arr[14]+@board_string_arr[21]+@board_string_arr[22]+@board_string_arr[23]).split("")
    @grid[2]= (@board_string_arr[6]+@board_string_arr[7]+@board_string_arr[8]+@board_string_arr[15]+@board_string_arr[16]+@board_string_arr[17]+@board_string_arr[24]+@board_string_arr[25]+@board_string_arr[26]).split("")
    @grid[3]= (@board_string_arr[27]+@board_string_arr[28]+@board_string_arr[29]+@board_string_arr[36]+@board_string_arr[37]+@board_string_arr[38]+@board_string_arr[45]+@board_string_arr[46]+@board_string_arr[47]).split("")
    @grid[4]= (@board_string_arr[30]+@board_string_arr[31]+@board_string_arr[32]+@board_string_arr[39]+@board_string_arr[40]+@board_string_arr[41]+@board_string_arr[48]+@board_string_arr[49]+@board_string_arr[50]).split("")
    @grid[5]= (@board_string_arr[33]+@board_string_arr[34]+@board_string_arr[35]+@board_string_arr[42]+@board_string_arr[43]+@board_string_arr[44]+@board_string_arr[51]+@board_string_arr[52]+@board_string_arr[53]).split("")
    @grid[6]= (@board_string_arr[54]+@board_string_arr[55]+@board_string_arr[56]+@board_string_arr[63]+@board_string_arr[64]+@board_string_arr[65]+@board_string_arr[72]+@board_string_arr[73]+@board_string_arr[74]).split("")
    @grid[7]= (@board_string_arr[57]+@board_string_arr[58]+@board_string_arr[59]+@board_string_arr[66]+@board_string_arr[67]+@board_string_arr[68]+@board_string_arr[75]+@board_string_arr[76]+@board_string_arr[77]).split("")
    @grid[8]= (@board_string_arr[60]+@board_string_arr[61]+@board_string_arr[62]+@board_string_arr[69]+@board_string_arr[70]+@board_string_arr[71]+@board_string_arr[78]+@board_string_arr[79]+@board_string_arr[80]).split("")
  end

  def solve
    create_collections
    while (@board_string_arr.include?("-") && @changed_var == true)
      @changed_var = false
      @board_string_arr.each do
        unless check_cell == false
          extract_cell_info
          replace_with_answer
        end
        next_cell
      end
    end
    to_s
  end

  def next_cell
    @cell_counter+=1
    @cell_counter=0 if @cell_counter == 81
    create_collections
  end

  def check_cell
    return true if @board_string_arr[@cell_counter] == "-"
    return false
  end

  def extract_cell_info
    @cell_hash["row"] = @cell_counter/9
    @cell_hash["column"] = @cell_counter%9
    @grid_arr.each_with_index do |minigrid,index|
      @cell_hash["grid"]= index if minigrid.include? cell_counter
    end
  end

  def replace_with_answer
    possible_nums = %w[ 1 2 3 4 5 6 7 8 9] - @row[@cell_hash["row"]] - @column[@cell_hash["column"]] - @grid[@cell_hash["grid"]]
    if possible_nums.count == 1
      @board_string_arr[@cell_counter] = possible_nums[0]
      @changed_var = true
    end
  end

  def board
    counter = 0
    @row.each do |row_num|
      puts " -----------------------------------" if counter%3==0
      row_num.each_with_index do |cell_pos, index|
        if (index%9 != 8 && index%9 != 0)
          print "#{cell_pos} | "
        elsif index%9 == 8
          puts "#{cell_pos} |"
        else
          print "| #{cell_pos} | "
        end
      end
      counter += 1
    end
    puts " -----------------------------------"
  end

  # Returns a nicely formatted string representing the current state of the board
  def to_s
    if @board_string_arr.include? ("-")
      puts "This puzzle is unsolvable. Here is the best solution through simple logic:"
      puts "#{@board_string_arr.join("")}"
    else
      puts "Solved! Here is the solution: #{@board_string_arr.join("")}"
    end
  end

end

board = Sudoku.new ("-8--2-----4-5--32--2-3-9-466---9---4---64-5-1134-5-7--36---4--24-723-6-----7--45-")
board.solve
board.board
board = Sudoku.new ("---6891--8------2915------84-3----5-2----5----9-24-8-1-847--91-5------6--6-41----")
board.solve
board.board

