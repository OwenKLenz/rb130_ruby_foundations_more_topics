# Write a minitest assertion that will fail if the Array list is not empty.

require 'minitest/autorun'

class TestValue < MiniTest::Test
  def test_array_empty
    array = []
    assert_equal(true, array.empty?)
  end

  def test_array_empty2
    array = []
    assert_empty(array)
  end
end