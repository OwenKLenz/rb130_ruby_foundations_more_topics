# Write a minitest assertion that will fail if the class of value is not Numeric
#  or one of Numeric's subclasses (e.g., Integer, Float, etc).

require 'minitest/autorun'

class TestKindOf < MiniTest::Test
  def setup
    @value = 10
  end

  def test_kind_of_with_numeric
    assert_kind_of(Numeric, @value)
  end

  def test_kind_of_with_integer
    assert_kind_of(Integer, @value)
  end
end