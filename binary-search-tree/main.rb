# frozen_string_literal: true

require_relative 'bst_node'

# Test BST::Node
leave1 = TNode.new(100)
leave2 = TNode.new(200)
leave3 = TNode.new(300)

p leave1 < leave2
p leave2 < leave3
p leave3 > leave1
