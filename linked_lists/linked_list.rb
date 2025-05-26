# frozen_string_literal: true

require_relative 'node'

module LinkedList
  # Linked List Class
  # @version 1.0.7
  class LinkedList
    attr_accessor :head

    # @since 1.0.0
    # @version 1.0.1
    def initialize(head = nil)
      @head = head
    end

    # Adds a new node containing `value` to the end of the list
    # @since 1.0.0
    # @version 1.0.1
    def append(value)
      if head.nil?
        self.head = Node.new(value)
      else
        current = traversal
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

    # Returns the total number of nodes in the list
    # @return [Integer] total number of nodes
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

    # Returns the first node in the list
    # @return [LinkedList::Node, nil] a node object or `nil` if the list empty
    # @since 1.0.3
    # @version 1.0.0
    def head_node
      head
    end

    # Returns the first node in the list
    # @return [LinkedList::Node, nil] a node object or `nil` if the list is empty
    # @since 1.0.3
    # @version 1.0.1
    def tail_node
      return nil if head.nil?

      traversal
    end

    # Returns the node at the given `index`
    # @param index [Integer] node position
    # @return [LinkedList::Node, nil] a node object or `nil` if list is empty or index is out of bound
    # @since 1.0.4
    # @version 1.0.0
    def at(index)
      return nil if head.nil?
      return head if index.zero?

      count = 0
      current = head
      until current.next_node.nil? || count == index
        current = current.next_node
        count += 1
      end
      return current if count == index

      nil
    end

    # Removes the last element from the list
    # @return [LinkedList::Node, nil] a node object or `nil` if the list is empty
    # @since 1.0.4
    # @version 1.0.0
    def pop
      return nil if head.nil?

      current = head
      second_last = nil
      until current.next_node.nil?
        second_last = current
        current = current.next_node
      end
      current == head ? self.head = nil : second_last.next_node = nil
      current
    end

    # Returns true if the passed in value is in the list and otherwise returns false
    # @return [Boolean] whether the value is in the list
    # @since 1.0.5
    # @version 1.0.0
    def contains?(value)
      return false if head.nil?

      current = head
      return true if current.value == value

      current = current.next_node until current.next_node.nil? || current.value == value
      current.value == value
    end

    # Returns the index of the node containing value, or `nil` if not found
    # @return [Integer, nil] the index position of the node object, or `nil if not found
    # @since 1.0.6
    # @version 1.0.0
    def find(value)
      return nil if head.nil?

      count = 0
      current = head
      return count if current.value == value

      until current.next_node.nil? || current.value == value
        current = current.next_node
        count += 1
      end
      return count if current.value == value

      nil
    end

    # Returns the Linked List object as strings
    # @return [String] a string representation of the Linked List object
    # @since 1.0.7
    # @version 1.0.0
    def to_s
      return 'nil' if head.nil?

      str = ''
      current = head
      until current.nil?
        str += "( #{current.value} ) -> "
        current = current.next_node
      end
      "#{str}nil"
    end

    # @todo #insert_at(value, index)
    # @todo #remove_at(index)

    private

    # Returns the current(last) elements in the list
    # @since 1.0.4
    # @version 1.0.0
    def traversal
      current = head
      current = current.next_node until current.next_node.nil?
      current
    end
  end
end

# Alias to the Linked List: Linked List Class
LList = LinkedList::LinkedList
