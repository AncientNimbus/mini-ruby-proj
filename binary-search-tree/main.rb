# frozen_string_literal: true

require_relative 'bst_tree'

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

# Test print
tree.pretty_print

# Test insert
tree.insert(6)
tree.insert(2000)
tree.insert(2.2)
# tree.insert(2.2)

# Test delete
# tree.delete(7000)
# tree.delete(8)
# tree.delete(7)
# tree.delete(67)
# p tree.delete(1)

# Test find
# p tree.find(23)

# Test level order
# tree.level_order { |node| puts node.value }
# p tree.level_order

# Test Inorder
# tree.inorder { |node| puts node.value }
# enum_test = tree.inorder
# enum_test.each { |elem| puts elem.value }

# Test Preorder
# tree.preorder { |node| puts node.value }
# tree.preorder

# Test Postorder
# tree.postorder { |node| puts node.value }
# tree.postorder

# Test height
p tree.height(4)

# Test depth
# p tree.depth(1)

# Test balanced?
p tree.balanced?

# Test rebalance
tree.pretty_print
tree.rebalance
p tree.balanced?

tree.pretty_print
