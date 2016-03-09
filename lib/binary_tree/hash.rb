require "binary_tree/hash/node"

module BinaryTree
  module Hash
    # Creates a new binary tree that acts like a Hash object.
    # By default, the tree will contain no values, but a first key and value can be given.
    # If a block is passed, it will be called when a value is looked up that does not exist
    # in the tree. The block will be called with |tree, missing_key|.
    def self.new(first_key = nil, first_value = nil, &block)
      Node.new(first_key, first_value, nil, &block)
    end
  end
end
