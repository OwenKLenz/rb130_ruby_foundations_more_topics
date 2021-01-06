# The Range#step method lets you iterate over a range of values where each 
# value in the iteration is the previous value plus a "step" value. It 
# returns the original range.

# Write a method that does the same thing as Range#step, but does not 
# operate on a range. Instead, your method should take 3 arguments: the 
# starting value, the ending value, and the step value to be applied to each 
# iteration. Your method should also take a block to which it will yield 
# (or call) successive iteration values.

# input: Integers
# output: The final value reached

# Considerations:
#   What happens when the steps don't take us to the final value?
#     stop stepping before passing the final value (end on it or stop before it)
#   invalid arguments (start is greater than end, step is less than 1)

# Algo:
#   init accum var to start value
#   pass accum to block
#   increment accum by step_by
#   return accum - step_by if accum is greater than the stop value
#   keep looping

class TooSmallError < Exception; end


def step(start, stop, step_by)
  if start >= stop
    raise ArgumentError.new("First argument must be less than second argument") 
  elsif step_by < 1
    raise TooSmallError.new("Must step by 1 or greater increments")
  end

  accum = start

  loop do
    yield(accum)
    accum += step_by
    return accum - step_by if accum > stop
  end
end

# Example:

puts (step(1, 11, 6) { |value| puts "value = #{value}" })

# value = 1
# value = 4
# value = 7
# value = 10
# What do you think would be a good return value for this method, and why?