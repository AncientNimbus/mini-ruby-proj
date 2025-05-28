# frozen_string_literal: true

require_relative '../linked-lists/linked_list'
require_relative '../linked-lists/node'
require_relative 'hash_map'

# HashSet Module
module HashSet
  # HashSet Class - Mirrored functionalities scope from HashMap::HashMap
  # @version 1.0.0
  class HashSet < HMHash
    undef_method :values

    def set(key)
      list = bucket(key)

      current_node = list.head_node
      while current_node
        return current_node.value = key if current_node.value == key

        current_node = current_node.next_node
      end
      list.append(key)
      expand_buckets
    end

    def get(key)
      current_node = bucket(key).head_node
      while current_node
        return current_node.value if current_node.value == key

        current_node = current_node.next_node
      end
      nil
    end

    def remove(key)
      list = bucket(key)

      current_node = list.head_node
      count = 0
      while current_node
        if current_node.value == key
          value = current_node.value
          list.remove_at(count)
          return value
        end
        current_node = current_node.next_node
        count += 1
      end
      nil
    end

    def keys
      entries
    end

    private

    def expand_buckets
      buckets_size = length
      return if buckets_size.zero? || buckets_size / capacity.to_f < load_factor

      old_entries = entries

      self.capacity *= 2
      self.buckets = Array.new(capacity) { LList.new }

      old_entries.each { |k| set(k) }
    end
  end
end

# Alias for HashSet::HashSet
HSet = HashSet::HashSet
