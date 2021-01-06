# Write a minitest assertion that will fail if value is not an instance of the 
# Numeric class exactly. value may not be an instance of one of Numeric's 
# superclasses.

require 'minitest/autorun'

class TestValue < MiniTest::Test
  def test_if_value_from_class
    value = Numeric.new
    assert_instance_of(Numeric, value)
  end

  def test_but_with_assert_equal
    value = 200
    refute_equal(Numeric, value.class)
  end
end