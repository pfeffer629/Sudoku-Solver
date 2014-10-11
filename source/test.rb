
board_string=("6-873----2-----46-----6482--8---57-19--618--4-31----8-86-2---39-5----1--1--4562--")
board_string_arr = board_string.split("")
row = {}
row[1] = board_string_arr[0..8]
row[2] = board_string_arr[9..17]
row[3] = board_string_arr[18..26]
row[4] = board_string_arr[27..35]
row[5] = board_string_arr[36..44]
row[6] = board_string_arr[45..53]
row[7] = board_string_arr[54..62]
row[8] = board_string_arr[63..71]
row[9] = board_string_arr[72..80]

test_row = {}
test_row = board_string_arr.each_slice(9).to_a

column = {}
puts row[1] == test_row[0]
column[1] = (board_string_arr[0]+board_string_arr[9]+board_string_arr[18]+board_string_arr[27]+board_string_arr[36]+board_string_arr[45]+board_string_arr[54]+board_string_arr[63]+board_string_arr[72]).split("")

test_column = {}
test_column = test_row.transpose

puts column[1] == test_column[0]
