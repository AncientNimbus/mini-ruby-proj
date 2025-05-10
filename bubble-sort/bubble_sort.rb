# frozen_string_literal: true

def bubble_sort(arr)
  (arr.length - 1).times do
    arr.each_with_index do |num, i|
      if i != arr.length - 1 && num > arr[i + 1]
        arr[i] = arr[i + 1]
        arr[i + 1] = num
      end
    end
  end

  arr
end

to_sort = [4, 3, 78, 2, 0, 2]
p bubble_sort(to_sort)
