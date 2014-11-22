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
    assign_relationships
    @nodes.each do |node|
      if node.value == "-"
        difference = @all_possible_values - node.all_values
        if difference.length == 1
          node.value = difference.join("")
        end
      end
    end

      if @nodes.any? { |node| node.value == "-" }
        solve
      else
        return "Sudoku solved!!!"
      end
  end

  def advanced_solve
    @nodes.each do |node|
      if node.box_value.uniq.length == node.box_values.length && node.col_values.uniq.length == node.col_values.length && node.col_values.uniq.length == node.col_values.length

  def board
  end

  # Returns a nicely formatted string representing the current state of the board
  def to_s

  end

  # Tested and works
  def assign_row_heads
    @nodes.map { |node| node if (0..80).step(9).to_a.include? node.original_index }.compact
  end

  # Tested and works
  def assign_col_heads
    @nodes.map { |node| node if (0..8).to_a.include? node.original_index }.compact
  end

  # Tested and works
  def assign_box_heads
    @nodes.map { |node| node if [0,3,6,27,30,33,54,57,60].to_a.include? node.original_index }.compact
  end

  # Tested and works
  def assign_row_head_relationships
    assign_row_heads.each { |node|
      index_of_next_child_node = node.original_index+1
      8.times {
        node.row_mates << @nodes[index_of_next_child_node]
        index_of_next_child_node += 1
      }
    }
  end

  # Tested and works
  def assign_col_head_relationships
    assign_col_heads.each { |node|
      index_of_next_child_node = node.original_index+9
      8.times {
        node.col_mates << @nodes[index_of_next_child_node]
        index_of_next_child_node += 9
      }
    }
  end

  # Tested and works
  def assign_box_head_relationships
    assign_box_heads.each { |node|
        [1,2,9,10,11,18,19,20].each { |num_to_add_to_index|
          index_of_next_child_node = node.original_index+num_to_add_to_index
          node.box_mates << @nodes[index_of_next_child_node]
      }
    }
  end

  # Tested and works
  def assign_relationships
    assign_row_head_relationships.each do |node|
      new_row_mates = node.row_mates << node
      node.row_mates.each do |row_mate|
        row_mate.row_mates = new_row_mates.select { |node| node != row_mate }
      end
    end

    assign_col_head_relationships.each do |node|
      new_col_mates = node.col_mates << node
      node.col_mates.each do |col_mate|
        col_mate.col_mates = new_col_mates.select { |node| node != col_mate }
      end
    end

    assign_box_head_relationships.each do |node|
      new_box_mates = node.box_mates << node
      node.box_mates.each do |box_mate|
        box_mate.box_mates = new_box_mates.select { |node| node != box_mate }
      end
    end
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

sudoku = Sudoku.new("---6891--8------2915------84-3----5-2----5----9-24-8-1-847--91-5------6--6-41----")

puts sudoku.solve


# sudoku.nodes[18].box_mates.each do |box_mate|
#   puts box_mate.original_index
# end
