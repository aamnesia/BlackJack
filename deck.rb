class Deck
  attr_reader :cards

  def initialize
    create_deck
    @cards.shuffle!
  end

  def create_deck
    ranks = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
    suits = ['♦', '♠', '♥ ', '♣']
    @cards = []
    ranks.each do |rank|
      suits.each do |suit|
        @cards << Card.new(rank, suit)
      end
    end
  end

  def draw(hand, number_of_cards)
    number_of_cards.times { hand.cards << @cards.pop }
  end
end
