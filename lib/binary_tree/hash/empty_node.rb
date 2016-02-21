module BinaryTree
  module Hash
    class EmptyNode
      def to_a
        []
      end

      def inspect
        "{}"
      end

      def lookup(*)
        nil
      end

      def store(*)
        false
      end
    end
  end
end
