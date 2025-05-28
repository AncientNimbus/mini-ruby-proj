# frozen_string_literal: true

require_relative 'bst_tree'
require_relative 'bst_node'

# Test BST::Node
# leaf1 = Node.new(100)
# leaf2 = Node.new(200)
# leaf3 = Node.new(300)

# p leaf1 < leaf2
# p leaf2 < leaf3
# p leaf3 > leaf1

# Test Data
data = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

# Test BST::BST
tree = BTree.new(data)

p tree.pretty_print
