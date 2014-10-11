class Sudoku
  attr_reader :row, :column, :grid, :board_string_arr, :board_string, :cell_hash, :cell_counter
  def initialize(board_string)
    @board_string = board_string
    @board_string_arr = @board_string.split("")
    @grid = {}
    @row = {}
    @column = {}
    @possible_val = []
    @cell_counter = 1
    @changed_var = true
    @cell_hash = {}
    @grid_arr = [[1,2,3,10,11,12,19,20,21],[4,5,6,13,14,15,22,23,24],[7,8,9,16,17,18,25,26,27],[28,29,30,37,38,39,46,47,48],[31,32,33,40,41,42,49,50,51],[34,35,36,43,44,45,52,53,54],[55,56,57,64,65,66,73,74,75],[58,59,60,67,68,69,76,77,78],[61,62,63,70,71,72,79,80,81]]
    @while_counter = 0
    @changes_counter = 0
  end



  def create_collections
    @row[1] = @board_string_arr[0..8]
    @row[2] = @board_string_arr[9..17]
    @row[3] = @board_string_arr[18..26]
    @row[4] = @board_string_arr[27..35]
    @row[5] = @board_string_arr[36..44]
    @row[6] = @board_string_arr[45..53]
    @row[7] = @board_string_arr[54..62]
    @row[8] = @board_string_arr[63..71]
    @row[9] = @board_string_arr[72..80]
    # @row = @board_string_arr.split'').each_slice9).to_a
    @column[1]= (@board_string_arr[0]+@board_string_arr[9]+@board_string_arr[18]+@board_string_arr[27]+@board_string_arr[36]+@board_string_arr[45]+@board_string_arr[54]+@board_string_arr[63]+@board_string_arr[72]).split("")
    @column[2]= (@board_string_arr[1]+@board_string_arr[10]+@board_string_arr[19]+@board_string_arr[28]+@board_string_arr[37]+@board_string_arr[46]+@board_string_arr[55]+@board_string_arr[64]+@board_string_arr[73]).split("")
    @column[3]= (@board_string_arr[2]+@board_string_arr[11]+@board_string_arr[20]+@board_string_arr[29]+@board_string_arr[38]+@board_string_arr[47]+@board_string_arr[56]+@board_string_arr[65]+@board_string_arr[74]).split("")
    @column[4]= (@board_string_arr[3]+@board_string_arr[12]+@board_string_arr[21]+@board_string_arr[30]+@board_string_arr[39]+@board_string_arr[48]+@board_string_arr[57]+@board_string_arr[66]+@board_string_arr[75]).split("")
    @column[5]= (@board_string_arr[4]+@board_string_arr[13]+@board_string_arr[22]+@board_string_arr[31]+@board_string_arr[40]+@board_string_arr[49]+@board_string_arr[58]+@board_string_arr[67]+@board_string_arr[76]).split("")
    @column[6]= (@board_string_arr[5]+@board_string_arr[14]+@board_string_arr[23]+@board_string_arr[32]+@board_string_arr[41]+@board_string_arr[50]+@board_string_arr[59]+@board_string_arr[68]+@board_string_arr[77]).split("")
    @column[7]= (@board_string_arr[6]+@board_string_arr[15]+@board_string_arr[24]+@board_string_arr[33]+@board_string_arr[42]+@board_string_arr[51]+@board_string_arr[60]+@board_string_arr[69]+@board_string_arr[78]).split("")
    @column[8]= (@board_string_arr[7]+@board_string_arr[16]+@board_string_arr[25]+@board_string_arr[34]+@board_string_arr[43]+@board_string_arr[52]+@board_string_arr[61]+@board_string_arr[70]+@board_string_arr[79]).split("")
    @column[9]= (@board_string_arr[8]+@board_string_arr[17]+@board_string_arr[26]+@board_string_arr[35]+@board_string_arr[44]+@board_string_arr[53]+@board_string_arr[62]+@board_string_arr[71]+@board_string_arr[80]).split("")
    # @column = @row.transpose
    @grid[1]= (@board_string_arr[0]+@board_string_arr[1]+@board_string_arr[2]+@board_string_arr[9]+@board_string_arr[10]+@board_string_arr[11]+@board_string_arr[18]+@board_string_arr[19]+@board_string_arr[20]).split("")
    @grid[2]= (@board_string_arr[3]+@board_string_arr[4]+@board_string_arr[5]+@board_string_arr[12]+@board_string_arr[13]+@board_string_arr[14]+@board_string_arr[21]+@board_string_arr[22]+@board_string_arr[23]).split("")
    @grid[3]= (@board_string_arr[6]+@board_string_arr[7]+@board_string_arr[8]+@board_string_arr[15]+@board_string_arr[16]+@board_string_arr[17]+@board_string_arr[24]+@board_string_arr[25]+@board_string_arr[26]).split("")
    @grid[4]= (@board_string_arr[27]+@board_string_arr[28]+@board_string_arr[29]+@board_string_arr[36]+@board_string_arr[37]+@board_string_arr[38]+@board_string_arr[45]+@board_string_arr[46]+@board_string_arr[47]).split("")
    @grid[5]= (@board_string_arr[30]+@board_string_arr[31]+@board_string_arr[32]+@board_string_arr[39]+@board_string_arr[40]+@board_string_arr[41]+@board_string_arr[48]+@board_string_arr[49]+@board_string_arr[50]).split("")
    @grid[6]= (@board_string_arr[33]+@board_string_arr[34]+@board_string_arr[35]+@board_string_arr[42]+@board_string_arr[43]+@board_string_arr[44]+@board_string_arr[51]+@board_string_arr[52]+@board_string_arr[53]).split("")
    @grid[7]= (@board_string_arr[54]+@board_string_arr[55]+@board_string_arr[56]+@board_string_arr[63]+@board_string_arr[64]+@board_string_arr[65]+@board_string_arr[72]+@board_string_arr[73]+@board_string_arr[74]).split("")
    @grid[8]= (@board_string_arr[57]+@board_string_arr[58]+@board_string_arr[59]+@board_string_arr[66]+@board_string_arr[67]+@board_string_arr[68]+@board_string_arr[75]+@board_string_arr[76]+@board_string_arr[77]).split("")
    @grid[9]= (@board_string_arr[60]+@board_string_arr[61]+@board_string_arr[62]+@board_string_arr[69]+@board_string_arr[70]+@board_string_arr[71]+@board_string_arr[78]+@board_string_arr[79]+@board_string_arr[80]).split("")
  end

  def solve
    create_collections
    while (@changed_var == true && @board_string_arr.include?("-"))
      @while_counter += 1
      puts "This round is: #{@while_counter}"
      @changed_var = false
      @board_string_arr.each do |x|
        unless check_cell == false
          extract_cell_info
          get_all_possibilities
        end
        @cell_counter+=1
        @cell_counter=1 if @cell_counter == 82
      end
      puts "Changes made in this round: #{@changes_counter}"
      @changes_counter = 0
      create_collections
    end
    output = @board_string_arr.join("")
    p output
  end

  def check_cell
    if @board_string_arr[@cell_counter-1] == "-"
      return true
    else
      return false
    end
  end

  def extract_cell_info
    if @cell_counter%9 == 0
      @cell_hash["row"] = (@cell_counter/9)
    else
      @cell_hash["row"] = (@cell_counter/9)+1
    end
    if @cell_counter%9 == 0
      @cell_hash["column"] = 9
    else
      @cell_hash["column"] = @cell_counter%9
    end
    @grid_arr.each_with_index do |minigrid,index|
      if minigrid.include? cell_counter
        @cell_hash["grid"]= index+1
      end
    end
  end

  def get_all_possibilities
    possible_nums= %w[ 1 2 3 4 5 6 7 8  9]
    possible_nums -= @row[@cell_hash["row"]]
    possible_nums -= @column[@cell_hash["column"]]
    possible_nums -= @grid[@cell_hash["grid"]]
    if possible_nums.count == 1
      @board_string_arr[@cell_counter-1] = possible_nums[0]
      @changed_var =true
      @changes_counter += 1
    end
  end

  def board

  end

  # Returns a nicely formatted string representing the current state of the board
  def to_s
    # print "#{@row[1].join("")},'\n','hi' }" #@row[1].join("") + @row[2].join("") + @row[3].join("") ,'\n' , @row[4].join("") + @row[5].join("") + @row[6].join("")
  end

end


board = Sudoku.new ("6-873----2-----46-----6482--8---57-19--618--4-31----8-86-2---39-5----1--1--4562--")
board.solve
# p "Counter: #{board.cell_counter}"
# p "Cell Hash: #{board.cell_hash}"
# p board.get_all_possibilities
#tweak
