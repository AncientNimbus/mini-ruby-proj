# frozen_string_literal: true

require_relative '../linked-lists/linked_list'
require_relative '../linked-lists/node'

# HashMap Module
module HashMap
  # HashMap Class
  # @version 1.0.1
  class HashMap
    attr_accessor :capacity, :buckets
    attr_reader :load_factor

    def initialize
      @load_factor = 0.8
      @capacity = 16
      @buckets = Array.new(capacity, LList.new)
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
    # @version 1.0.0
    def set(key, value)
      bucket_idx = hash(key) % capacity
      data = [key, value]
      list = buckets[bucket_idx]

      current_node = list.head_node
      while current_node
        return current_node.value = data if current_node.value[0] == key

        current_node = current_node.next_node
      end
      list.append(data)
    end

    # @todo #get(key)
    # @todo #has?(key)
    # @todo #remove(key)
    # @todo #length
    # @todo #clear
    # @todo #keys
    # @todo #values
    # @todo #entries
  end
end

# Alias for HashMap::HashMap
HMHash = HashMap::HashMap

# snippet to use
#   raise IndexError if index.negative? || index >= @buckets.length
