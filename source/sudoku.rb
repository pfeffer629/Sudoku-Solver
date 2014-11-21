class Sudoku

  attr_accessor :board_string, :nodes, :all_possible_values

  def initialize(board_string)
    @board_string = board_string
    @nodes = []
    @all_possible_values = ("1".."9").to_a
    create_nodes
  end

    def create_nodes
    @board_string.split("").each_with_index { |value, index|
      @nodes << Node.new(value, index)
    }
  end

  def solve
    @nodes.each { |node|
      puts "Node value is: #{node.value}"
      if node.value == "-"
        puts "Node value should be '-'"
        difference = @all_possible_values - node.all_values
        puts "Node.all_values is #{node.all_values}"
        puts "Difference is #{difference}"
        if difference.length == 1
          node.value = difference.join("")
        end
      end
    }
      if @nodes.any? { |node| node.value == "-" }
        solve
      else
        return "Sudoku solved!!!"
      end
  end

  def board
  end

  # Returns a nicely formatted string representing the current state of the board
  def to_s
  end

  def assign_relationships

  end

end

class Node

  attr_accessor :value, :row_mates, :col_mates, :box_mates, :original, :original_index

  def initialize(value, original_index)
    @value = value
    @row_mates = []
    @col_mates = []
    @box_mates = []
    @original = false
    @original_index = original_index
    set_original
  end

  def set_original
    @original = true if @value != "-"
  end

  def row_values
    @row_mates.map { |object| object.value }
  end

  def col_values
    @col_mates.map { |object| object.value }
  end

  def box_values
    @box_mates.map { |object| object.value }
  end

  def all_values
    (box_values + row_values + col_values).reject { |value| value == "-" }
  end
end

sudoku = Sudoku.new("12-1")
sudoku.nodes[0].col_mates << sudoku.nodes[2]
sudoku.nodes[1].col_mates << sudoku.nodes[3]
sudoku.nodes[2].col_mates << sudoku.nodes[0]
sudoku.nodes[3].col_mates << sudoku.nodes[1]

sudoku.nodes[0].row_mates << sudoku.nodes[1]
sudoku.nodes[1].row_mates << sudoku.nodes[0]
sudoku.nodes[2].row_mates << sudoku.nodes[3]
sudoku.nodes[3].row_mates << sudoku.nodes[2]

# p sudoku.nodes[0].all_values
# p sudoku.nodes[1].all_values
# p sudoku.nodes[2].all_values
# p sudoku.nodes[3].all_values

p sudoku.all_possible_values
