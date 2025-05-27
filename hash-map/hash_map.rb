# frozen_string_literal: true

require_relative '../linked-lists/linked_list'
require_relative '../linked-lists/node'

# HashMap Module
module HashMap
  # HashMap Class
  # @version 1.0.7
  class HashMap
    attr_accessor :capacity, :buckets
    attr_reader :load_factor

    def initialize
      @load_factor = 0.8
      @capacity = 16
      @buckets = Array.new(capacity) { LList.new }
    end

    # Take a key and produces a hash code with it.
    # @param key [String] expecting a String as key value in accordance to the project scope
    # @param prime_num [Integer] a prime number, with default value of `31`
    # @return [Integer] hash code
    # @since 1.0.0
    # @version 1.0.0
    def hash(key, prime_num: 31)
      hash_code = 0
      prime_number = prime_num

      key.each_char { |char| hash_code = (prime_number * hash_code) + char.ord }

      hash_code
    end

    # Set the key's value, if a key already exists, overwrites the old value.
    # @param key [String] a String as key value
    # @param value [Object]
    # @since 1.0.1
    # @version 1.0.1
    def set(key, value)
      list = bucket(key)
      data = [key, value]

      current_node = list.head_node
      while current_node
        return current_node.value = data if current_node.value[0] == key

        current_node = current_node.next_node
      end
      list.append(data)
    end

    # Returns the value that is assigned to this key, returns `nil` if key not found.
    # @param key [String] a String as key value
    # @since 1.0.2
    # @version 1.0.1
    def get(key)
      current_node = bucket(key).head_node
      while current_node
        return current_node.value[1] if current_node.value[0] == key

        current_node = current_node.next_node
      end
      nil
    end

    # Returns `true` or `false` based on whether or not the key is in the hash map.
    # @param key [String] a String as key value
    # @return [Boolean] returns true if key is in the hash
    # @since 1.0.3
    # @version 1.0.0
    def has?(key)
      current_node = bucket(key).head_node
      while current_node
        return true if current_node.value[0] == key

        current_node = current_node.next_node
      end
      false
    end

    # Deletes and returns a value in the hash if the given key is in the hash, else returns `nil`.
    # @param key [String] a String as key value
    # @return [Object, nil] returns the deleted value or nil
    # @since 1.0.3
    # @version 1.0.0
    def remove(key)
      list = bucket(key)

      current_node = list.head_node
      count = 0
      while current_node
        if current_node.value[0] == key
          value = current_node.value[1]
          list.remove_at(count)
          return value
        end
        current_node = current_node.next_node
        count += 1
      end
      nil
    end

    # Returns the number of stored keys in the hash map.
    # @return [Integer] number of keys
    # @since 1.0.4
    # @version 1.0.0
    def length
      buckets.inject(0) { |count, bucket| count + bucket.size }
    end

    # Removes all entries in the hash map
    # @since 1.0.5
    # @version 1.0.0
    def clear
      self.buckets = Array.new(capacity) { LList.new }
    end

    # Returns an array containing all the keys inside the hash map.
    # @return [Array<String>] an array of keys
    # @since 1.0.6
    # @version 1.0.1
    def keys
      entries.map { |elem| elem[0] }
    end

    # Returns an array containing all the values inside the hash map.
    # @return [Array<Object>] an array of values
    # @since 1.0.6
    # @version 1.0.1
    def values
      entries.map { |elem| elem[1] }
    end

    # Returns an array that contains each `[key, value]` pair.
    # @return [Array<Array<String, Object>>] an array of values
    # @since 1.0.7
    # @version 1.0.0
    def entries
      buckets.flat_map do |bucket|
        current_node = bucket.head_node
        values = []
        while current_node
          values << current_node.value
          current_node = current_node.next_node
        end
        values
      end
    end

    private

    # Convert String key value to bucket index.
    # @param key [String] a String as key value
    # @return [Integer] converted hash key
    # @since 1.0.2
    # @version 1.0.0
    def to_idx(key)
      hash(key) % capacity
    end

    # Takes a String key value and returns bucket's linked list object.
    # @param key [String] a String as key value
    # @return [LinkedList::LinkedList] a linked list object
    # @since 1.0.2
    # @version 1.0.0
    def bucket(key)
      bucket_idx = to_idx(key)
      raise IndexError if bucket_idx.negative? || bucket_idx >= buckets.length

      buckets[bucket_idx]
    end
  end
end

# Alias for HashMap::HashMap
HMHash = HashMap::HashMap
