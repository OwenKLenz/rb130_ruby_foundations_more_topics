# Write a test that will fail if 'xyz' is one of the elements in the Array list:

require 'minitest/autorun'

class TestRefutation < MiniTest::Test
  def setup
    @str = 'xyz'
    @array1 = %w(abc xyz)
    @array2 = %w(abc xxx)
  end

  def test_refute_with_array_and_string1
    refute(@array1.include?(@str))
  end

  def test_refute_with_array_and_string2
    refute_includes(@array1, @str)
  end

  def test_refute_with_array_and_string3
    refute(@array2.include?(@str))
  end

  def test_refute_with_array_and_string4
    refute_includes(@array2, @str)
  end
end