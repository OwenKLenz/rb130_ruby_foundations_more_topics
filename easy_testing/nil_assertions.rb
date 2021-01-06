# Write a minitest assertion that will fail if value is not nil.

require 'minitest/autorun'

class TestValue < MiniTest::Test
  def test_refute_value_nil
    value = "hello, world"
    refute_nil(value)
  end

  def test_assert_value_nil
    value = nil
    assert_nil(value)
  end
end