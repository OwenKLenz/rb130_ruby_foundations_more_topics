# Write a method called any? that behaves similarly for Arrays. It should take 
# an Array as an argument, and a block. It should return true if the block 
# returns true for any of the element values. Otherwise, it should return false.

# input: Array (and a block)
# output: boolean

# considerations:
#   empty arrays return false

# Algo:
#   each to iterate
#   yield to a block with each element in the collection
#   capture the return value of the block (boolean)
#   return true if return value is true, else continue
#   return false at end
require 'set'
def any?(array)
  return nil unless block_given?
  array.each do |el|
    return true if yield(el)
  end
  false
end
# Examples:

p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false

my_set = Set.new([1, 2, 3, 4])

p any?({a: "a", b: "b"}) { |key, value| value == "c"  } == false
p any?(my_set) { |el| el == 0 } == false
