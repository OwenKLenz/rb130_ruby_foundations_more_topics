# Write a minitest assertion that will fail if the 'xyz' is not in the Array 
# list.

require 'minitest/autorun'

class ArrayContainsTest < MiniTest::Test
  def test_array_includes1
    array = ['abc', 'xyz']
    assert_includes(array, 'xyz')
  end

  def test_array_includes2
    array = ['abc', 'wxy']
    assert_includes(array, 'xyz')
  end

  def test_array_for_value
    assert(['abc', 'xyz'].include?('xyz'))
  end
end