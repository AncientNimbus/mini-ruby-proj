# frozen_string_literal: true

# rubocop: disable Metrics/AbcSize
def bubble_sort(arr)
  n = arr.length

  (0...n - 1).each do |pass|
    swapped = false

    (0...n - 1 - pass).each do |i|
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        swapped = true
      end
    end
    break unless swapped
  end
  arr
end
# rubocop: enable Metrics/AbcSize

# to_sort = [4, 3, 78, 2, 0, 2]
# p bubble_sort(to_sort)
