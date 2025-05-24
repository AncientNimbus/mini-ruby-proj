# frozen_string_literal: true

require_relative 'fibonacci'

# Merge sort module
module MergeSort
  class << self
    # Return a sorted array in descending order
    # @param arr [Array<Integer>] unsorted array
    # @return [Array<Integer>] sorted array in descending order
    # @version 1.0.0
    def merge_sort(arr)
      arr
    end
  end
end

# Alias for Merge sort
MS = MergeSort

# Debug
def fibs(num, ver: 2)
  ver == 1 ? F.fibs(num) : F.fibs_rec(num)
end

unsorted_arr = fibs(8).shuffle
p "Unsorted: #{unsorted_arr}"

sorted_arr = MS.merge_sort(unsorted_arr)
p "Sorted: #{sorted_arr}"
