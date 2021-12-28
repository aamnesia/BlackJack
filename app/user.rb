class User
  attr_reader :own_bank
  attr_accessor :name

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
