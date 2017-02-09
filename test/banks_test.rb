gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/banks'
require './lib/person'

class BanksTest < Minitest::Test

  def test_has_a_name
    bank1 = Banks.new("Chase")

    assert_equal "Chase", bank1.bank_name
  end

  def test_it_can_open_new_account
    bank1 = Banks.new("Chase")
    person1 = Person.new("Colleen", 500)


    response = "An account has been opened for Colleen with Chase."
    assert_equal response, bank1.open_account(person1)
  end

  def test_it_can_make_deposit
    bank1 = Banks.new("Chase")
    person1 = Person.new("Colleen", 500)

    response = "100 galleons have been deposited into Colleen's Chase account. Balance:  Cash: 400"
    assert_equal response, bank1.deposit(person1, 100)
  end
end
