class User
  attr_reader :name :own_bank

  def initialize(name = "Dealer")
    @name = name
    @own_bank = 100
  end

  def make_a_bet(bet)
    @own_bank -= bet
  end

  def take_money(bet)
    @own_bank += bet
  end
end
