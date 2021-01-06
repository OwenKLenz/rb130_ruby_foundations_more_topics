# The Enumerable#each_cons method iterates over the members of a collection 
# taking each sequence of n consecutive elements at a time and passing them to 
# the associated block for processing. It then returns a value of nil.

# Write a method called each_cons that behaves similarly for Arrays, taking the 
# elements 2 at a time. The method should take an Array as an argument, and a 
# block. It should yield each consecutive pair of elements to the block, and 
# return nil.

# Your method may use #each, #each_with_object, #each_with_index, #inject, loop
# , for, while, or until to iterate through the Array passed in as an argument,
# but must not use any other methods that iterate through an Array or any other
# collection.

# input: Array
# output: nil

# gist:
#   pass consecutive pairs of array elements to the block as we iterate across
#   the array. Stop if the last  element is out of bounds.

# considerations:
#   Try to accept an argument for the number of cons values (n)
#   What happens when there are fewer elements than the cons value (stop)

# algo:
#   init index to 0
#   init consecutive_num to 1
#   stop if index + consecutive_num is greater than or equal to size of array
#   pass subarray from index to index + consecutive_num to block
#   return nil

def each_cons(array, consecutive_num=2)
  return nil if array.empty? || !block_given?

  array.each_index do |index|
    return nil if index + consecutive_num - 1 >= array.size
    yield(array[index..(index + consecutive_num - 1)])
  end
end

# Examples:

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil