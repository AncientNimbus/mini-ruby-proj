# frozen_string_literal: true

require_relative 'node'

module LinkedList
  # Linked List Class
  # @version 1.0.1
  class LinkedList
    attr_accessor :head, :tail

    def initialize(head = nil, tail = nil)
      @head = head
      @tail = tail
    end

    # Adds a new node containing `value` to the end of the list
    # @since 1.0.0
    # @version 1.0.0
    def append(value)
      if head.nil?
        self.head = Node.new(value)
      else
        current = head
        current = current.next_node until current.next_node.nil?
        current.next_node = Node.new(value)
      end
    end

    # Adds a new node containing `value` to the start of the list
    # @since 1.0.1
    # @version 1.0.0
    def prepend(value)
      old_head = head
      self.head = Node.new(value)
      head.next_node = old_head
    end

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
