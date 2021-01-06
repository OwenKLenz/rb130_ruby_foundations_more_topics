require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def setup
    @cash_register = CashRegister.new(100)
  end
  
  def test_accept_money
    transaction = Transaction.new(19.99)
    @cash_register.accept_money(transaction)

    assert_equal(100, @cash_register.total_money)

    transaction.amount_paid = 19.99
    @cash_register.accept_money(transaction)
    
    assert_equal(119.99, @cash_register.total_money)
  end

  def test_change
    transaction = Transaction.new(5.00)
    transaction.amount_paid = 7.50
    assert_equal(2.50, @cash_register.change(transaction))

    transaction = Transaction.new(5.00)
    transaction.amount_paid = 5.00
    assert_equal(0, @cash_register.change(transaction))
  end

  def test_give_receipt
    transaction = Transaction.new(12.50)
    transaction.amount_paid = 12.25
    assert_output("You've paid $12.5.\n") { @cash_register.give_receipt(transaction) }
  end

  def test_prompt_for_payment
    trans = Transaction.new(10)
    trans.prompt_for_payment(input: 12)
    assert_equal(12, trans.amount_paid)
  end
end