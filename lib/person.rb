require './lib/banks'

class Person
  attr_reader :name, :cash, :banks

  def initialize(name, cash)
    @name = name
    @cash = cash
    @banks = {}
  end

  # def cash_balance
  #
  # end

end
