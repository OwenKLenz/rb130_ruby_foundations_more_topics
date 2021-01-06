# Write a minitest assertion that will fail if value.downcase does not return 
# 'xyz'.

require 'minitest/autorun'

class TestValue < MiniTest::Test
  def setup
    @value = 'XY'
  end

  def test_value
    assert_equal('xyz', @value.downcase)
  end
end