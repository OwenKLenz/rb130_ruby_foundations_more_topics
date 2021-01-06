# Write a method called each_with_object that behaves similarly for Arrays. It 
# should take an Array and an object of some sort as an argument, and a block. 
# It should yield each element and the object to the block. each_with_object 
# should return the final value of the object.

# input: a collection(array), an object (empty array or hash), a block
# output: the object(with any mutations made to it)

# considerations:
#   empty arrays return the original object argument

# algo:
#   iterate over the collection passing each element and the object to a block
#   return the object at the end

def each_with_object(collection, obj)
  collection.each { |el| yield(el, obj) }
  obj
end

# Examples:

result = each_with_object([1, 3, 5], []) do |value, list|
  list << value**2
end
p result == [1, 9, 25]

result = each_with_object([1, 3, 5], []) do |value, list|
  list << (1..value).to_a
end
p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

result = each_with_object([1, 3, 5], {}) do |value, hash|
  hash[value] = value**2
end
p result == { 1 => 1, 3 => 9, 5 => 25 }

result = each_with_object([], {}) do |value, hash|
  hash[value] = value * 2
end
p result == {}