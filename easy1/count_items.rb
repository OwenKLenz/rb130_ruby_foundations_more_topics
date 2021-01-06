# Write a method that takes an array as an argument, and a block that returns 
# true or false depending on the value of the array element passed to it. The 
# method should return a count of the number of times the block returns true.

# You may not use Array#count or Enumerable#count in your solution.

# input: array and a block
# output: an integer (count of trues)

# considerations:
#   empty array or all falses should return 0

# algo:
#   init counter to 0
#   iterate over collection
#   yield to block with each element
#   if the block returns true increment counter
#   return counter at end



def count(array)
  counter = 0
  return counter unless block_given?
  array.each { |el| counter += 1 if yield(el) }
  counter
end

# Further Exploration:

def count2(array)
  array.select { |el| yield(el) }.size
end

def count3(array, index=0, counter=0, &block)
  return counter if index == array.size
  counter += 1 if yield(array[index])
  count3(array, index + 1, counter, &block)
end

def count4(array, counter=0, &block)
  return counter if array.size.zero?
  count4(array[1..], yield(array[0]) ? counter + 1 : counter, &block)
end

# Examples: (And some benchmarking of my original solution and the final recursive solution)
time1 = Time.now
1000000.times do
  count([1,2,3,4,5]) { |value| value.odd? } == 3
  count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
  count([1,2,3,4,5]) { |value| true } == 5
  count([1,2,3,4,5]) { |value| false } == 0
  count([]) { |value| value.even? } == 0
  count(%w(Four score and seven)) { |value| value.size == 5 } == 2
end
puts Time.now - time1

# p count2([1,2,3,4,5]) { |value| value.odd? } == 3
# p count2([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
# p count2([1,2,3,4,5]) { |value| true } == 5
# p count2([1,2,3,4,5]) { |value| false } == 0
# p count2([]) { |value| value.even? } == 0
# p count2(%w(Four score and seven)) { |value| value.size == 5 } == 2

time1 = Time.now
1000000.times do
  count3([1,2,3,4,5]) { |value| value.odd? } == 3
  count3([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
  count3([1,2,3,4,5]) { |value| true } == 5
  count3([1,2,3,4,5]) { |value| false } == 0
  count3([]) { |value| value.even? } == 0
  count3(%w(Four score and seven)) { |value| value.size == 5 } == 2
end
puts Time.now - time1

time1 = Time.now
1000000.times do
  count4([1,2,3,4,5]) { |value| value.odd? } == 3
  count4([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
  count4([1,2,3,4,5]) { |value| true } == 5
  count4([1,2,3,4,5]) { |value| false } == 0
  count4([]) { |value| value.even? } == 0
  count4(%w(Four score and seven)) { |value| value.size == 5 } == 2
end
puts Time.now - time1