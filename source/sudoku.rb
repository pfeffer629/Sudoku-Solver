class Sudoku
  attr_accessor :board_string, :board_array
  def initialize(board_string)
    #initialize the string
    @matches = []
    @board_string = board_string
    @board_array = @board_string.split('').each_slice(9).to_a # {|number| number.to_a }
    solve
  end

  def solve # a.k.a. runner
    # calls the method
    find_empty_cell
  end
=begin


# METHODS

# 1. FIND EMPTY CELL(S)
input: string
  # Find first dash / empty cell
output: sting index
=end
def find_empty_cell

  @board_string.split("").each_with_index do |number, index|
    if number == "-"
      find_row_numbers(index)
    else
      return @board_string
    end

  # @board_string.each_char do |numbers|
  #   # numbers == "-" ? numbers.index("-") : "Hello"
  #   p @board_string[numbers]
end
end

def find_row_numbers(index)
  coordinates = index.divmod(9) # =>  [row,col]
  # this_is_the_row =  # this is the row
   @matches << @board_array[coordinates[0]] # board's row
   find_col_numbers(coordinates)
 end
=begin
# 2. ROW
input: empty cell
  @ first empty cell, grab the row
      How to grab row:
        based on index from empty cell
          our string is divided in sets of 9s (rows)
          cell matches a "set" and iterates through the row
            **** check divisability by 9  *****
output: collection of numbers in that row
# COLUMN
input: empty cell
  Next, grab column @ that index for every row successively
output: collection of numbers in that column
=end
def find_col_numbers(coordinates)
   @matches << @board_array.transpose[coordinates[0]] # board's row
   find_nonet(coordinates)
 end

 def find_nonet(coordinates)
    # Grab first 27 char
    # slice in 3s
    #  take each slice & pushes it into boxes 1-3
    # wash rinse repeat
    # p coordinates
    nonet_value_holder = Array.new(9, []) # => [[],[],[],[],[],[],[,[],[],[],]]

    set_of_3 = @board_string.slice(0..80).split('').each_slice(3).to_a
    counter = 0

#  BIG DREAMS RIGHT HERE : ONE DAY THIS SHIT WILL WORK
    # if counter <= 2
    #    nonet_value_holder[counter] << set_of_3.shift
    #    counter +=1
    # else
    #   break
    # end

    # nonet_value_holder[0].push(set_of_3[0], set_of_3[3], set_of_3[6], set_of_3[9], set_of_3[12],,)
    # nonet_value_holder[1].push()
    # nonet_value_holder[2].push()
    # nonet_value_holder[3].push()
    # nonet_value_holder[4].push()
    # nonet_value_holder[5].push()
    # nonet_value_holder[6].push()
    # nonet_value_holder[7].push()
    # nonet_value_holder[8].push()



git add

git commit -a -m ""




  # @matches <<
end
end
=begin
 NONET
input: empty cell
  Next - grab the nonet.
output: collection of numbers in that nonet

 MISSING NUMBERS
input: collection of numbers from row, col & nonet
  Now we have 3 sets of numbers
    check for what numbers are not there.
    we have a list of candidates.
  Check for volume of candidates.  If 1 plug it in & restart the process.
output: candidates / missing numbers for that cell

CHECK FOR SINGLE CAND #
input: collection of candidates
output: true/false if it has one candidate

    PLUG in #
    input: collection of candidates (it has one)
       insert in the empty cell
    output: start back at the beginning //// RECURE THIS!



    =end
  def board
  end

  def

  # Returns a nicely formatted string representing the current state of the board
  def to_s
  end
end

=end


