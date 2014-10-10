#Sudocode
#Create board
  #fill from string
  #split, create arrays
  #print board all fancy
#

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

    while @board.flatten.include? "-" #run solve while there are empty spaces

    #wrapped outer loop while board does not contain - OR while not solved
      #A loop loops through elements in the entire board
        #If element equals "-"
          #clear potential vals array
            #while potential unqiques.size < 1
              #For every valid sudoku number (1..9)
                #if valid unique row
                  #if valid unique col
                    #if valid unique box
                      #add to array potential vals
        #Else increment

        #setting valid number in need to do

    end #end while loop
  end

#*** paramters
#*** description
  def board
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




p proper_box(6, 5)
p proper_box(8, 8)
p proper_box(0, 0)
p proper_box(2, 0)

