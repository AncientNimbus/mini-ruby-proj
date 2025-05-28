# frozen_string_literal: true

require_relative 'bst_node'

# Alias for BST::Node
Node = BST::Node

module BST
  # BST Class
  # @since 1.0.0
  # @version 1.0.0
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

    # @todo #insert
    # @todo #delete
    # @todo #find
    # @todo #level_order
    # @todo #inorder
    # @todo #preorder
    # @todo #postorder
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
  end
end

# Alias for BST::BST
BTree = BST::BST
