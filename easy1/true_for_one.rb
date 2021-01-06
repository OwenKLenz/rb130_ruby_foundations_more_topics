# Write a method called one? that behaves similarly for Arrays. It should 
# take an Array as an argument, and a block. It should return true if the 
# block returns true for exactly one of the element values. Otherwise, it 
# should return false.

# input: Array
# output: boolean

# considerations:
#   empty should return false
#   more than one true return of the block should return false
#   no true returns should return false

# algo:
#   init boolean var to false
#   iterate (each) over the collection yielding to block
#   if block returns true and boolean var is true
#     return false
#     otherwise set boolean var to true

#   at the end return boolean var

def one?(array)
  found = false

  array.each do |el|
    if yield(el)
      return false if found
      found = true
    end
  end
  found
end

# Examples:

p one?([1, 3, 5, 6]) { |value| value.even? }    == true
p one?([1, 3, 5, 7]) { |value| value.odd? }     == false
p one?([2, 4, 6, 8]) { |value| value.even? }    == false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p one?([1, 3, 5, 7]) { |value| true }           == false
p one?([1, 3, 5, 7]) { |value| false }          == false
p one?([]) { |value| true }                     == false