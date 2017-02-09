require './lib/person'
class Banks

  attr_reader :bank_name

  def initialize(bank_name)
    @bank_name = bank_name
  end

  def open_account(person)
    person.banks[bank_name] = 0
    "An account has been opened for #{person.name} with #{bank_name}."
  end

  def deposit (person, deposit_amount)
    person.banks[bank_name] += deposit_amount
    person.cash -= deposit_amount
    "#{deposit_amount} galleons have been deposited into #{person.name}'s #{bank_name} account. Balance:  Cash: #{person.cash - deposit_amount}"
  end

end
