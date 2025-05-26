# frozen_string_literal: true

module LinkedList
  # Node Class
  # @version 1.0.0
  class Node
    attr_accessor :value, :next_node

    def initialize(value = nil, next_node = nil)
      @value = value
      @next_node = next_node
    end
  end
end

# Alias to the Linked List: Node Class
Node = LinkedList::Node
