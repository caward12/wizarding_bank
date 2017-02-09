gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/person'
require './lib/banks'


class PersonTest < Minitest::Test

  def test_it_knows_name
    person1 = Person.new("Colleen", 500)

    assert_equal "Colleen", person1.name
  end

  def test_it_knows_cash_amount
    person1 = Person.new("Tom", 200)

    assert_equal 200, person1.cash
  end

  def test_it_can_store_bank_accounts
    person1 = Person.new("Tom", 200)
    bank1 = Banks.new("Chase")
    bank1.open_account(person1)

    assert_equal "Chase", person1.banks.keys.join
  end

  def test_it_can_store_deposit_amounts_with_bank_name
    person1 = Person.new("Tom", 200)
    bank1 = Banks.new("Chase")
    bank1.open_account(person1)
    bank1.deposit(person1, 100)

    assert_equal [100], person1.banks.values_at("Chase")
  end

  def test_it_can_increase_account_balance_at_particular_bank
    person1 = Person.new("Tom", 400)
    bank1 = Banks.new("Chase")
    bank1.open_account(person1)
    bank1.deposit(person1, 100)
    bank1.deposit(person1, 50)

    assert_equal [150], person1.banks.values_at("Chase")
  end

  def test_it_can_keep_track_of_available_cash
    person1 = Person.new("Tom", 400)
    bank1 = Banks.new("Chase")
    bank1.open_account(person1)
    bank1.deposit(person1, 100)

    assert_equal 300, person1.cash 
  end
end
