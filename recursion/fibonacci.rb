# frozen_string_literal: true

# Fibonacci module
module Fibonacci
  class << self
    # Fibonacci Iterative ver.
    # @param num [Integer] number of elements to return
    # @return [Array: Integer] fibonacci sequence array
    # @version 1.0.2
    def fibs(num)
      return if num.zero?
      return [0] if num == 1

      arr = [0, 1]
      arr << (arr[-1] + arr[-2]) while arr.size < num
      arr
    end

    # Fibonacci Recursive ver.
    # @param num [Integer] number of elements to return
    # @return [Array: Integer] fibonacci sequence array
    # @version 1.0.0
    def fibs_rec(num)
      return if num.zero?
      return [0] if num == 1

      arr = [0, 1]
      return arr if num == 1

      puts "Fibonacci recursive ver. Expected outcome: Fibs: #{num} = [0, 1, 1, 2, 3, 5, 8, 13]"
    end
  end
end

# Alias for Fibonacci module
F = Fibonacci

# Debug
def debug(num, ver: 1)
  seq = ver == 1 ? F.fibs(num) : F.fibs_rec(num)
  puts seq.class
  puts seq.inspect
end

debug(2)
# debug(8, ver: 2)
