class Sudoku

#*** paramters
#*** description

  def initialize(board_string)

    board_string = board_string.split("")

    @board = Array.new(9) {Array.new(9, "x")}

    counter = 0
    @board.each_index do |i|
      @board[0].each_index do |j|
        @board[i][j] = board_string[counter]
        counter += 1
      end
      puts
    end

    @potential_vals = []

  end

#*** paramters
#*** description
  def print_board
    #print board
    @board.each_index do |i|
      @board[0].each_index do |j|
        print @board[i][j] + " "
      end
      puts
    end
  end

#*** paramters
#*** description
  def solve

    #a. wrapped outer loop while board does not contain - OR while not solved
    while @board.flatten.include? "-" #run solve while there are empty spaces


      #b. A loop loops through elements in the entire board
      @board.each_index do |i|
        @board[0].each_index do |j|

        #c. If element equals "-"
          if @board[i][j] == "-"

            #d. clear potential vals array
            @potential_vals.clear

              #f. For every valid sudoku number (1..9)
              for z in 1..9 #1...9

                #g. if valid unique row
                if unique_in_row?(i, j, z.to_s)
                  #h. if valid unique col
                  if unique_in_col?(i, j, z.to_s)
                    #i. if valid unique box
                    if unique_in_box?(i, j, z.to_s)
                      @potential_vals.push(z.to_s) #if all tests return true push item on to potenital list
                    end #end i
                  end #end h
                end #end g


              end #f. 1..9 loop


            if @potential_vals.length == 1
              @board[i][j] = @potential_vals[0]
            end
            # end #e. end potenial vals while loop

          end #c.
          #increments here to next cell


        end #.b
      end #(b)

    end #a. end while loop


  end #end of solve

#*** paramters
#*** description
  def unique_in_row?(row, col, val)

    if @board[row].include? val
      return false
    else
      return true
    end

  end

#*** paramters
#*** description
  def unique_in_col?(row, col, val)

    #return true or false
    temp = @board.transpose
    if temp[col].include? val
      return false
    else
      return true
    end

  end

#*** paramters
#*** description
  def unique_in_box?(row, col, val)

    row, col = proper_box(row, col) #call for proper starting box index

    temp = []

    temp.push(@board[row][col])
    temp.push(@board[row][col+1])
    temp.push(@board[row][col+2])
    temp.push(@board[row+1][col])
    temp.push(@board[row+1][col+1])
    temp.push(@board[row+1][col+2])
    temp.push(@board[row+2][col])
    temp.push(@board[row+2][col+1])
    temp.push(@board[row+2][col+2])

    if temp.include? val
      return false
    else
      return true
    end

  end

#*** parameters: row, col
#*** description: returns the index for looping through sub box the element is in
  def proper_box(row, col)

    target_row = row
    target_col = col
  #target row
  if(target_row.between?(0, 2))
    target_row = 0
  elsif(target_row.between?(3, 5))
    target_row = 3
  else
    target_row = 6
  end
  #target_col
  if(target_col.between?(0, 2))
    target_col = 0
  elsif(target_col.between?(3, 5))
    target_col = 3
  else
    target_col = 6
  end

  return target_row, target_col

end

end

g = Sudoku.new("---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---")
g.print_board
g.solve
puts
g.print_board

g2 = Sudoku.new("--5-3--819-285--6-6----4-5---74-283-34976---5--83--49-15--87--2-9----6---26-495-3")
g2.print_board
g2.solve
puts
g2.print_board











