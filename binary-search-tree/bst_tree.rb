# frozen_string_literal: true

require_relative 'bst_node'

# Alias for BST::Node
Node = BST::Node

module BST
  # BST Class
  # @version 1.0.3
  class BST
    attr_accessor :root

    def initialize(data = [])
      @root = build_tree(data)
    end

    # Build a balanced BST from an array
    # @param data [Array<Object>] an array of data
    # @since 1.0.0
    # @version 1.0.0
    def build_tree(data)
      return if data.empty?

      arr = preprocess_data(data)
      arr_size = arr.size

      mid = arr[arr_size / 2]
      left  = arr.shift(arr_size / 2)
      right = arr.slice(1..)

      Node.new(mid, build_tree(left), build_tree(right))
    end

    # BST visualization snippet
    # @since 1.0.0
    # @version 1.0.0
    def pretty_print(node = root, prefix = '', is_left: true)
      pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", is_left: false) if node.right
      puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
      pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", is_left: true) if node.left
    end

    # Insert new node when a leaf node is found, return root if a duplicate is found.
    # @param value [Object] a value for the node object
    # @since 1.0.1
    # @version 1.0.0
    def insert(value)
      new_node = Node.new(value)
      parent = nil
      current_node = root
      until current_node.nil?
        return root if new_node == current_node

        parent = current_node
        current_node = current_node > new_node ? current_node.left : current_node.right
      end
      parent < new_node ? parent.right = new_node : parent.left = new_node
      root
    end

    # Takes a value and delete the node if found.
    # @param value [Object] a value for the node object
    # @since 1.0.1
    # @version 1.0.0
    def delete(value, node = root)
      return if node.nil?

      if node.value > value
        node.left = delete(value, node.left)
      elsif node.value < value
        node.right = delete(value, node.right)
      else
        # When left branch is empty, return the right branch.
        return node.right if node.left.nil?
        # When right branch is empty, return the left branch.
        return node.left if node.right.nil?

        # When both children are present
        next_node = get_successor(node)
        node.value = next_node.value
        node.right = delete(next_node.value, node.right)
      end
      node
    end

    # Takes a value and returns the node with the given value.
    # @param value [Object] a value to search
    # @since 1.0.2
    # @version 1.0.0
    def find(value)
      current_node = root
      until current_node.nil?
        return current_node if current_node.value == value

        current_node = current_node.value > value ? current_node.left : current_node.right
      end
      nil
    end

    # Returns an array of values via the breadth-first method
    # @since 1.0.2
    # @version 1.0.0
    def level_order(&)
      return to_enum(:level_order) unless block_given?

      queue = [root]

      until queue.empty?
        current = queue.shift
        yield current

        queue << current.left if current.left
        queue << current.right if current.right

      end
    end

    # Returns an array of values via the in-order order
    # @since 1.0.3
    # @version 1.0.0
    def inorder(node = root, &)
      return to_enum(:inorder, node) unless block_given?
      return if node.nil?

      inorder(node.left, &)
      yield node
      inorder(node.right, &)
    end

    # Returns an array of values via the pre-order order
    # @since 1.0.3
    # @version 1.0.0
    def preorder(node = root, &)
      to_enum(:preorder, node) unless block_given?
      return if node.nil?

      yield node
      preorder(node.left, &)
      preorder(node.right, &)
    end

    # Returns an array of values via the post-order order
    # @since 1.0.3
    # @version 1.0.0
    def postorder(node = root, &)
      to_enum(:postorder, node) unless block_given?
      return if node.nil?

      postorder(node.left, &)
      postorder(node.right, &)
      yield node
    end
    # @todo #height
    # @todo #depth
    # @todo #balanced
    # @todo #rebalance

    private

    # A helper to sort and remove duplicates in a data array before entering the tree
    # @param data [Array<Object>] an array of data
    # @since v1.0.0
    # @version v1.0.0
    def preprocess_data(data)
      data.sort.uniq
    end

    # Get successor (only when right is not empty)
    # @version v1.0.0
    def get_successor(current_node)
      current_node = current_node.right
      current_node = current_node.left until current_node.left.nil?
      current_node
    end
  end
end

# Alias for BST::BST
BTree = BST::BST
