# frozen_string_literal: true

require_relative 'knights_travails'

knight = KnightTravails::Knight.new

# knight.moves([1, 2], [4, 5])
# knight.moves([3, 3], [4, 3])
# knight.moves([0, 0], [0, 0])
# knight.moves([0, 0], [1, 1])
knight.moves([0, 0], [7, 7])
