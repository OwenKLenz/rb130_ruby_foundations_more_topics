# Write a test that will fail if list and the return value of list.process are 
# different objects.

require 'minitest/autorun'

class List
  def process
    self
  end
end

class TestIfSameObject < MiniTest::Test
  def test_if_same_object
    object = List.new
    assert_same(object, object.process)
  end
end