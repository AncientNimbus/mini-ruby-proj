# frozen_string_literal: true

require_relative '../linked-lists/linked_list'
require_relative '../linked-lists/node'

# HashMap Module
module HashMap
  # HashMap Class
  # @version 1.0.0
  class HashMap
    attr_accessor :capacity
    attr_reader :load_factor

    def initialize
      @load_factor = 0.8
      @capacity = 16
    end

    # Take a key and produces a hash code with it
    # @param key [String] a key value
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

    # @todo #set(key, value)
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
