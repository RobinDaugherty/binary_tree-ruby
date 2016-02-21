require "binary_tree/set/empty_node"

module BinaryTree
  module Set
    class Node
      include Enumerable

      # Instantiates a new node. The value is optional so that a new tree containing
      # no value can be instantiated.
      def initialize(value, hash_value = nil)
        store_in_self(value, hash_value) if value
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

      # For Enumerable, yields each item in the set (in hash order).
      def each(&block)
        left.each(&block)
        yield value
        right.each(&block)
      end

      # For Enumerable
      def <=>(other)
        value <=> other.value
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

      def store(v, hv = nil)
        return store_in_self(v, hv) unless value

        hv ||= v.hash
        case hashed_value <=> hv
        when 1 then store_left(v, hv)
        when -1 then store_right(v, hv)
        end
      end

      private

      attr_accessor :left, :right, :value, :hashed_value

      def store_in_self(v, hv = nil)
        self.value = v
        self.hashed_value = hv || v.hash
        true
      end

      def store_left(v, hv)
        left.store(v, hv) or self.left = self.class.new(v, hv)
        true
      end

      def store_right(v, hv)
        right.store(v, hv) or self.right = self.class.new(v, hv)
        true
      end
    end
  end
end
