
=begin
UNTIL we have no more '-' in @board_string:
  1. find_next_empty(cell)
  2. possible_numbers = find_possibilities(cell)
      a. collect_numbers(cell)
  3. is_unique?(possible_numbers)
      a. IF YES, add possible_number to board
      b. IF NO, go to 1.
=end

class Sudoku
  def initialize(board_string)
    @board_string = board_string
  end

  def solve
    cell = 0
    until is_solved?
      cell = find_next_empty_cell(cell) #return the index of the next empty cell
      answers = find_possibilities(cell) # return all possible answers
      if is_unique?(answers) #we only have one answer!
        #do stuff
        # @board_string[cell] = answers[0]
      end
    end
  end

  def board
  end

  def get_row(index) #pass index from @board_string
    row_index = index #preserve index, make a copy of it and do stuff to the copy
    constructed_row = [] #this array will hold all the numbers in our row
    until row_index % 9 == 0 || row_index == 0 # given an index in a row keep moving left until we find the beginning of the row
      row_index -= 1 #walk backwards
    end
    9.times do #starting from beginning of row
      constructed_row << @board_string[row_index] #load the characters in the row into our array
      row_index += 1 #move to next cell in the row
    end
    constructed_row #return array of characters
  end

  def get_column(index)
    column_index = index #copy index of the cell on the board
    constructed_column = [] #create empty array that will hold our column
    until column_index >= 0 && column_index <= 8 #move up the column until you know you're at the top row(top row is 0-8)
        column_index -= 9
    end
    9.times do
      constructed_column << @board_string[column_index] #shovel each cell in the column
      column_index += 9 #move one cell down
    end
    constructed_column #return the whole column
  end
  def get_cluster(index)
    found_cluster = []
    constructed_cluster = [] # create an empty array to hold the chars that will populate our cluster
    all_clusters = (0..80).to_a.group_by{|each_index| (each_index/27)*3 + (each_index%9)/3} #this is a magic, beautiful hash with 9 keys
                                                                                            #each containing an array of the indeces
                                                                                            #(0-80) for each quadrant.
                                                                                            # Upper Left (0) is: [0,1,2,9,10,11,18,19,20]
    all_clusters.each_key do |cluster| #go through all the 9 clusters
      if all_clusters[cluster].include?(index) #find the cluster that has the index of the cell we're on
        found_cluster = all_clusters[cluster] #save that cluster in a new variable because you don't like refactoring right now. You just don't.
      end
    end
    found_cluster.each do |index| #in your cluster, iterate through each index
      constructed_cluster << @board_string[index] #plug each index into your board_string to get the elements
    end
    constructed_cluster #return that cluster!
  end

  def find_next_empty_cell(index)
    return index if @board_string[index] == "-" #guard clause for if we're already on empty cell
    board_string_copy = @board_string.split("") #protect our original data
    index+=1 #skip to the next index right off the bat.
    until board_string_copy[index] == '-' do #keep skipping to the next index until we find a '-'
      index += 1
    end
    index #return the index of the next '-' we find.
  end

  def collect_numbers(index)
    my_row = get_row(index) #get an array of characters on the row. There will be "-"s included
    my_column = get_column(index) ##get an array of characters on the column. There will be "-"s included
    my_cluster = get_cluster(index) # get array of chars for the cluster.
    results = (my_row + my_column + my_cluster).select { |cell| cell != '-'  } #add everything together and eliminate "-"
    results.uniq! #de-duplicate the results and return.
  end

  def find_possibilities(index)
    possible = %w(1 2 3 4 5 6 7 8 9) # make an array of all possible sudoku answers
    used = collect_numbers(index) # send the index of the cell we're working on over
                                  # to collect_numbers, it returns an array of all the
                                  # numbers that are ALREADY on the board in the
                                  # (row + column + cluster) associated with the cell.

    possible - used # remove all the numbers already on the board from the list of possibilities
                    # thus, you're left with what is possible for this cell. Return it!
  end

  def is_unique?(array)
    array.length == 1 ? true : false
  end

  def is_solved?(string)
    #use regex to look for "-", if you don't find any, return true because game is solved!
    string.match(/-/) == nil ? true : false
  end

  # Returns a nicely formatted string representing the current state of the board
  def to_s
  end
end

test_board = "----657816825-4931978345628261953473746829159517436285193268742489571367634182594"
test_board2 = "4-5269781682571493197834562826195347374682915951743628519326874248957136763418259"
game = Sudoku.new(test_board)
game2 = Sudoku.new(test_board2)


=begin
TESTBOARD1
----65781
6825-4931
978345628
261953473
746829159
517436285
193268742
489571367
634182594
=end

=begin
TESTBOARD2
4-5269781
682571493
197834562
826195347
374682915
951743628
519326874
248957136
763418259
=end

#DRIVER TEST CODE
#################################
p game.get_row(6) == game.get_row(8) #calling get_row with index on same row should get same result.
p game.get_row(13) == game.get_row(10)
p game.get_column(0) == game.get_column(54) #calling get_column with an index on the same column, you should get the same column!
p game.get_column(50) == game.get_column(77)
p game.find_next_empty_cell(0) == 0 #given a whatever cell we're on, should return next character in @board_string that is '-'
p game.find_next_empty_cell(1) == 1
p game.find_next_empty_cell(2) == 2
p game.find_next_empty_cell(6) == 13
p game.collect_numbers(0) == ["6", "5", "7", "8", "1", "9", "2", "4"]          #given a cell, collect all the numbers in the
p game.collect_numbers(13) == ["6", "8", "2", "5", "4", "9", "3", "1", "7"]    #rows, columns, clusters then return an array of
p game2.collect_numbers(1) == ["4", "5", "2", "6", "9", "7", "8", "1"]         #those with just the unique values (no duplicates)
p game2.find_possibilities(1) == ["3"] #given an empty cell, return all the possible values that it could be
p game2.find_possibilities(3) == [] #a completed cell should return no possibilities!
p game.is_unique?(["neil"]) == true #return true of an array has only one (unique) element.
p game.is_unique?(["neil","molly"]) == false #return false if an array has more than one element.
p game.is_solved?("123456789") == true
p game.is_solved?(test_board2) == false

p game2.get_cluster(0) == ["4", "-", "5", "6", "8", "2", "1", "9", "7"]
p game2.get_cluster(60) == ["8", "7", "4", "1", "3", "6", "2", "5", "9"]
p game2.get_cluster(45) == ["8", "2", "6", "3", "7", "4", "9", "5", "1"]
p game2.get_cluster(57) == game2.get_cluster(77) # two indeces in the same cluster should be equal.

###################################





