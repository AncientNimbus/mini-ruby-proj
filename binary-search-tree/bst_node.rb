# frozen_string_literal: true

# Binary Search Tree Module
module BST
  # BST Node Class
  # @since 1.0.0
  # @version 1.0.0
  class Node
    include Comparable

    attr_accessor :value, :left, :right

    def initialize(value = nil, left = nil, right = nil)
      @value = value
      @left = left
      @right = right
    end

    # Allow Comparable features between Node Objects
    # @param other [BST::Node] another BST Node object
    # @since 1.0.0
    # @version 1.0.0
    def <=>(other)
      raise TypeError, 'Expecting a Node object' unless other.is_a?(Node)
      raise StandardError, 'Object value cannot be nil' if other.value.nil?

      value <=> other.value
    end
  end
end
