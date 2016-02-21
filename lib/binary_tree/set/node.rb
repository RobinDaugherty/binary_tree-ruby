require "binary_tree/set/empty_node"

module BinaryTree
  module Set
    class Node
      # Instantiates a new node. The value is optional so that a new tree containing
      # no value can be instantiated.
      def initialize(value)
        store_in_self(value) if value
        @left = EmptyNode.new
        @right = EmptyNode.new
      end

      def include?(v)
        lookup(v.hash)
      end

      def add(v)
        store(v)
        self
      end
      alias_method :<<, :add

      def add?(v)
        return nil unless store(v)
        self
      end

      def inspect
        "[#{value.inspect}|#{left.inspect},#{right.inspect}]"
      end

      protected

      def lookup(hv)
        case hashed_value <=> hv
        when 1 then left.lookup(hv)
        when -1 then right.lookup(hv)
        when 0 then true
        end
      end

      def store(v)
        return store_in_self(v) unless value

        hv = v.hash
        case hashed_value <=> hv
        when 1 then store_left(hv, v)
        when -1 then store_right(hv, v)
        end
      end

      private

      attr_accessor :left, :right, :value, :hashed_value

      def store_in_self(v)
        self.value = v
        self.hashed_value = v.hash
        true
      end

      def store_left(hv, v)
        left.store(hv, v) or self.left = self.class.new(v)
        true
      end

      def store_right(hv, v)
        right.store(hv, v) or self.right = self.class.new(v)
        true
      end
    end
  end
end
