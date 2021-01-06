require 'minitest/autorun'
require_relative 'transaction'
require 'stringio'

class TransactionTest < MiniTest::Test
  def test_prompt_for_payment
    skip
    input = StringIO.new("12")
    trans = Transaction.new(10)
    trans.prompt_for_payment(input: input)
    assert_equal(12, trans.amount_paid)
  end

  def test_prompt_for_payment_supressing_output
    input = StringIO.new("12")
    output = StringIO.new
    trans = Transaction.new(10)
    trans.prompt_for_payment(input: input, output: output)
    assert_equal(12, trans.amount_paid)
  end
end