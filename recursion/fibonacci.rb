# frozen_string_literal: true

# Fibonacci module
module Fibonacci
  class << self
    # Fibonacci Iterative ver.
    # @param [Integer] length of the fibonacci sequence
    # @return [Array: Integer] fibonacci sequence array
    # @version 1.0.0
    def fibs(num)
      puts "Fibonacci iterative ver. Expected outcome: Fibs: #{num} = [0, 1, 1, 2, 3, 5, 8, 13]"
    end

    # Fibonacci Recursive ver.
    # @param [Integer] length of the fibonacci sequence
    # @return [Array: Integer] fibonacci sequence array
    # @version 1.0.0
    def fibs_rec(num)
      puts "Fibonacci recursive ver. Expected outcome: Fibs: #{num} = [0, 1, 1, 2, 3, 5, 8, 13]"
    end
  end
end

# Alias for Fibonacci module
F = Fibonacci

# Debug
def debug(num, ver: 1)
  seq = ver == 1 ? F.fibs(num) : F.fibs_rec(num)
  seq.inspect
end

debug(8)
debug(8, ver: 2)
