Input: string of numbers and dashes

Output: string of numbers

Steps:

1. PREPARE BOARD
  - prepare string
    - find input_string_length
    - num_inner_rows and num_inner_columns equal to square root of input_string_length
    - num_outer_rows and num_outer_columns equal to square root of num_inner_rows
  - create data structure: array of arrays, each outer array is a row with each element within that representing a number/dash
    *- initialize:
      - input: board_string
    *- board_string_to_array:
      - input: board_string (input as string)
      - output: board_array (input as )
      - steps:
        - push board_string into an array by splitting it by ""
        - batch string into sub-arrays by num_inner_rows (see notation on tic tac toe)
    *- board_string_to_boxes:
      - input: board_string (input as string)
      - output: n boxes, each box is an array of the n elements in that box
      - steps:
        - declare counter variable that starts on an even number
        - copy board_string to new variable
        - when counter is even shift sqrt n elements off of board_string into box1
          - if box1 has length n, shift to box3
        - when counter is odd shift sqrt n elements into box2
          - if box2 has length n, shift to box4
    *- prepare_board:
      - input: n/a
      - output: array version of board_string
      - steps:
        - set @board equal to calling board_string_to_array on @board


STOP

2. CHECK FOR ANY EMPTY CELLS - condition to break loop
  * is_empty?:
    - input: n/a
    - output: true if == '-' false otherwise

3. FIND POSITION OF EMPTY CELL - begin loop
  * empty_square_coordinates
    -output: array of coordinates

4. CHECK RELATED CELLS
  * check_row
    - input: row number, column number
    - output: array of possible numbers for that coordinate
    - steps:
      - array [1-9]
      - for each num in array
        - if @board[row].include?(num) != then push into array
        - return array

  * check column


  * check_box:
    - input: row number, column number
    - output: array of possible numbers for that coordinate
    - steps:
      - create data structrue that pairs block number with outer coordinates
        -
      - take input coordinate and divide by sqrt of n
      - go through data structure to find the block structure that mtches the new coordinates
      - take @boxes[num], for each num in array [1-9] if num not in boxes array and not already in possiblibites, add to possibilities

  * solve
    - iterate over @board with two each loops
      - if the element is empty:
        - length of poss == 1
          - sub character
        - if not on to next
      - if not empty
        next element

5. FIND POSSIBLE VALUES

6. IF ONLY 1 POSSIBILITY
  - enter number into cell

7. OTHERWISE CONTINUE TO NEXT - end loop

  425269781682571493197834562826195347374682915951743628519326874248957136763418259


["4", "2", "5", "2"]
["4", "2", "5", "2"]
["4", "2", "5", "2"]
["4", "2", "5", "2"]
