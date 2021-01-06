# Write a method that takes an optional block. If the block is specified, 
# the method should execute it, and return the value returned by the block. 
# If no block is specified, the method should simply return the String 
# 'Does not compute.'.

def compute
  if block_given?
    yield
  else
    "Does not compute."
  end
end

# Examples:

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

# Further Exploration
# Modify the compute method so it takes a single argument and yields that 
# argument to the block. Provide at least 3 examples of calling this new 
# version of compute, including a no-block call.

def compute(arg)
  return yield(arg) if block_given?
  "Does not compute."
end

compute("Cheese") { |arg| puts "I like #{arg}" }
compute([1, 2, 3]) { |collection| collection.each { |el| puts el + 1 }}
puts compute(:nope)