require "binary_tree/hash/empty_node"

module BinaryTree
  module Hash
    class Node
      # Instantiates a new node. The key and value are optional so that a new tree containing
      # no value can be instantiated.
      def initialize(key, value, hk = nil, &block)
        store_in_self(value, key, hk) if key
        @left = EmptyNode.new
        @right = EmptyNode.new
        @default_proc = block
      end

      def [](k)
        v = lookup(k.hash)
        return v if v
        default_proc.call(self, k) if default_proc
      end

      def fetch(k, default = nil, &block)
        v = lookup(k.hash) 
        return v if v
        return default if default
        return block.call if block_given?
        raise KeyError
      end

      def []=(k, v)
        store(v, k)
      end

      def inspect
        "{#{key} => #{value}:#{left.inspect}|#{right.inspect}}"
      end

      protected

      def lookup(hk)
        case hashed_key <=> hk
        when 1 then left.lookup(hk)
        when -1 then right.lookup(hk)
        when 0 then value
        end
      end

      def store(v, k, hk = nil)
        return store_in_self(v, k, hk) unless key

        hk ||= k.hash
        case hashed_key <=> hk
        when 1 then store_left(v, k, hk)
        when -1 then store_right(v, k, hk)
        when 0 then self.value = v
        end
      end

      private

      attr_reader :default_proc
      attr_accessor :left, :right, :value, :key, :hashed_key

      def store_in_self(v, k, hk)
        self.value = v
        self.key = k
        self.hashed_key = hk || k.hash
      end

      def store_left(v, k, hk)
        left.store(v, k, hk) or self.left = self.class.new(k, v)
      end

      def store_right(v, k, hk)
        right.store(v, k, hk) or self.right = self.class.new(k, v)
      end
    end
  end
end
