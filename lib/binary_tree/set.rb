require "binary_tree/set/node"

module BinaryTree
  module Set
    # Creates a new binary tree that acts like a Hash object.
    # By default, the tree will contain no values, but a first value can be given.
    def self.new(first_value = nil)
      Node.new(first_value)
    end
  end
end
