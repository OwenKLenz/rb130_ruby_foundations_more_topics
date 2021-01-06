# Assume we have a Tree class that implements a binary tree.

class Tree
  include Enumerable

  def each
    # implementation of each here
  end

  def <=>(other_tree)
  # implementation of <=> here
  end
end

# A binary tree is just one of many forms of collections, such as Arrays, Hashes, 
# Stacks, Sets, and more. All of these collection classes include the Enumerable 
# module, which means they have access to an each method, as well as many other 
#   iterative methods such as map, reduce, select, and more.

# For this exercise, modify the Tree class to support the methods of Enumerable. 
# You do not have to actually implement any methods -- just show the methods that 
#   you must provide.


# We can mixin the Enumerable module to gain access to all of the Enumerable 
# instance methods like select, map, etc. Some of the Enumerable methods require 
# object comparison to be implemented so to call methods like Enumerable#max, min
# or sort, we need to define a <=> method that returns -1, 0 or 1.