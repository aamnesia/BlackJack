class User
  attr_reader :name, :own_bank
  attr_accessor :hand

  def initialize(name = "Dealer")
    @name = name
    @own_bank = 100
    @hand = Hand.new
  end

  def make_a_bet(bet)
    @own_bank -= bet
  end

  def take_money(bet)
    @own_bank += bet
  end
end
