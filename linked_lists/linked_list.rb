# frozen_string_literal: true

require_relative 'node'

module LinkedList
  # Linked List Class
  # @version 1.0.0
  class LinkedList
    attr_accessor :head, :tail

    def initialize(head = nil, tail = nil)
      @head = head
      @tail = tail
    end

    # Adds a new node containing `value` to the end of the list
    def append(value)
      if head.nil?
        self.head = Node.new(value)
      else
        current = head
        current = current.next_node until current.next_node.nil?
        current.next_node = Node.new(value)
      end
    end
    # @todo #prepend(value)
    # @todo #size
    # @todo #head
    # @todo #tail
    # @todo #at(index)
    # @todo #pop
    # @todo #contains?(value)
    # @todo #find(value)
    # @todo #to_s
    # @todo #insert_at(value, index)
    # @todo #remove_at(index)
  end
end

# Alias to the Linked List: Linked List Class
LList = LinkedList::LinkedList
