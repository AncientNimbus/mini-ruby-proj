# frozen_string_literal: true

require_relative 'node'

module LinkedList
  # Linked List Class
  # @version 1.0.2
  class LinkedList
    attr_accessor :head, :tail

    # @since 1.0.0
    # @version 1.0.0
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
    # Returns the total number of nodes in the list
    # @since 1.0.2
    # @version 1.0.0
    def size
      return 0 if head.nil?

      count = 1
      current = head
      until current.next_node.nil?
        current = current.next_node
        count += 1
      end
      count
    end
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
