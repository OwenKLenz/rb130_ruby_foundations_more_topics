require 'minitest/autorun'
require_relative 'text_class'

class TextTest < MiniTest::Test
  def setup
    @file = File.open("sample_text.txt", 'r')
  end

  def test_swap
    text = Text.new(@file.read)

    assert_nil(text.swap('a', 'e').match(/a/))
  end

  def test_swap_thorough
    text = @file.read
    text_object = Text.new(text)
    letter_a_count_before = text.count('a')
    letter_e_count_before = text.count('e')

    result = text_object.swap('a', 'e')
    letter_a_count_after = result.count('a')
    letter_e_count_after = result.count('e')

    assert_equal(letter_a_count_before + letter_e_count_before, letter_e_count_after)
    assert_equal(0, letter_a_count_after)
  end

  def test_word_count
    text = Text.new(@file.read)
    assert_equal(72, text.word_count)
  end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end
end

