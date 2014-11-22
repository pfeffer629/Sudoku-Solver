class Sudoku

  attr_accessor :board_string, :nodes, :all_possible_values

  def initialize(board_string)
    @board_string = board_string
    @nodes = []
    @all_possible_values = ("1".."9").to_a
    create_nodes
    assign_relationships
  end

  def create_nodes
    @board_string.split("").each_with_index { |value, index| @nodes << Node.new(value, index) }
  end

  def add_value(node)
    node.value = (@all_possible_values - node.all_values).sample
  end

  def solve
    @nodes.each do |node|
      # If no rules are broken
      if node.box_values.uniq.length == node.box_values.length && node.col_values.uniq.length == node.col_values.length && node.row_values.uniq.length == node.row_values.length
        # If the board isn't solved AND the node's value is empty
        if @nodes.any? { |node| node.value == "-" } && node.value == "-"
          add_value(node)
          solve
        # If the board is solved!
        elsif @nodes.all? { |node| node.value != "-" }
          @nodes.each_with_index do |node, index|
            if index % 9 == 0
              # puts "\n\n"
              print "#{node.value}"
            else
              print "#{node.value}"
            end
          end
          return "Sudoku solved!!!"
        end
      #If any of the rules are broken
      else
        reset_values
        solve
      end
    end
  end

  def reset_values
    @nodes.each do |node|
      node.value = "-" unless node.original
    end
  end

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
    values = @row_mates.map { |object| object.value }
    values.reject { |value| value == "-" }
  end

  def col_values
    values = @col_mates.map { |object| object.value }
    values.reject { |value| value == "-" }
  end

  def box_values
    values = @box_mates.map { |object| object.value }
    values.reject { |value| value == "-" }
  end

  def all_values
    box_values + row_values + col_values
  end
end

time = Time.now
sudoku = Sudoku.new("---------------------------------------------------------------------------------")


puts sudoku.solve
puts Time.now - time
