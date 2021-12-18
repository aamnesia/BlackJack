class Card
  attr_reader :rank, :suit, :value

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @value = card_value
  end

  private

  def card_value
    if ['J', 'Q', 'K'].include? @rank
      return 10
    else
      return ['', 'A', '2', '3', '4', '5', '6', '7', '8', '9', '10'].index(@rank)
    end
  end
end
