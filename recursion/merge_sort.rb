# frozen_string_literal: true

# Merge sort module
module MergeSort
  class << self
    # Return a sorted array in ascending order
    # @param arr [Array<Integer>] unsorted array
    # @return [Array<Integer>] sorted array in ascending order
    # @version 1.0.0
    def merge_sort(arr)
      return arr unless arr.size > 1

      left_arr = arr.shift(arr.size / 2)
      left_sorted = merge_sort(left_arr)
      right_sorted = merge_sort(arr)

      merge(left_sorted, right_sorted)
    end

    # Helper method
    # @param left [Array<Integer>]
    # @param right [Array<Integer>]
    # @version 1.1.0
    def merge(left, right)
      result = []

      result << (left[0] < right[0] ? left.shift : right.shift) while left.any? && right.any?

      result + left + right
    end
  end
end

# Alias for Merge sort
MS = MergeSort
