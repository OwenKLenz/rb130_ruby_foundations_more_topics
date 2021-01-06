# The Array#zip method takes two arrays, and combines them into a single array 
# in which each element is a two-element array where the first element is a 
# value from one array, and the second element is a value from the second array, 
# in order. For example:

# [1, 2, 3].zip([4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
# Write your own version of zip that does the same type of operation. It should 
# take two Arrays as arguments, and return a new Array (the original Arrays 
# should not be changed). Do not use the built-in Array#zip method. You may 
# assume that both input arrays have the same number of elements.

# input: 2 arrays
# output: a new array (2d)

# considerations:
#   Maybe create a version that works for any number of argument arrays?
#   Empty arrays?

# Algo:
  # init counter to 0
  # init empty array

  # while counter < length of the arrays
  #   init subarray to a empty array
  #   iterate over the passed in arrays
  #   append each array's element at the index of counter to the subarray
  #   after covering each passed in array, append subarray to the empty return array
  #   increment hte counter

  #   return final array


def zip(*arrays)
  index = 0
  zipped_array = []
  while index < arrays[0].length
    zipped_array << arrays.map do |array|
                      array[index]
                    end
    index += 1
  end
  zipped_array
end

def zip(*arrays)
  arrays[0].each_index.with_object([]) do |index, zipped_arr|
    zipped_arr << arrays.map { |array| array[index] }
  end
end

# Example:



zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

zip([1, 2, 3], [4, 5, 6], [7, 8, 9], [10, 11, 12]) ==
      [[1, 4, 7, 10], [2, 5, 8, 11], [3, 6, 9, 12]]

p zip([1, 2, 3], [1], [4, 5])

p [1, 2, 3].zip([1], [4, 5])