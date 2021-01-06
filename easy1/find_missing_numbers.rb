# Write a method that takes a sorted array of integers as an argument, and 
# returns an array that includes all of the missing integers (in order) between 
# the first and last elements of the argument.

# input: array
# output: array

# data structures: Arrays

# block? Probaby not necessary

# Algo:
# if array size is 1 or less, return empty array
# Create a range to array from first element to last
# iterate across all the numbers in arg array and delete each number from the range array

# def missing(array)
#   new_arr = (array.first..array.last).to_a
#   array.each { |n| new_arr.delete(n) }
#   new_arr
# end

# With no block
def missing(array)
(array.first..array.last).to_a.difference(array)
end

# def missing(array)
#   counter = array.first
#   result = []
#   loop do
#     break if counter == array.last
#     result << counter unless array.include?(counter)
#     counter += 1
#   end

#   result
# end

# Examples:

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

