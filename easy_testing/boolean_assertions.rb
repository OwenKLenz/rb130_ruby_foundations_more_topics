# Write a minitest assertion that will fail if the value.odd? is not true.

require 'minitest/autorun'

class TestValue < MiniTest::Test
  def setup
    @value = rand(10)
  end

  def test_value
    assert(@value.odd?)
  end
end
value = 1
assert(value.odd?)