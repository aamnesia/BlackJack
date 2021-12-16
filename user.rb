class User

  def initialize
    @name
    @own_bank = 100
  end

  def make_a_bet(bank)
    bank += 10
    @own_bank -= 10
  end

  def take_money(bank)
    @own_bank += bank
    bank = 0
  end

end
