def row_population(string)
  array = board_maker(string)
  reference_array = [1,2,3,4,5,6,7,8,9]
  origin_array = ["-","-","-",2,6,"-",7,"-",1]
  array.each do |row|
    row.each_with_index do |cell,index|
      if cell == "-"
        num_array = row.select{|num| num.is_a?(Integer)}
        possibilities = reference_array - num_array
        poss_sample = possibilities[0]
        row[index] = poss_sample
        possibilities.delete(poss_sample)
      end
    end
    p array
  end
end

def board_maker(string)
  # board = string.split("")
  string.split('').each_slice(9).to_a
end
# p board_maker("---26-7-168--7--9-19---45--82-1---4---46-29---5---3-28--93---74-4--5--367-3-18---")
row_population("4-5269781682571493197834562826195347374682915951743628519326874248957136763418259")
