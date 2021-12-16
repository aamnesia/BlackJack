class Deck
  attr_reader :cards

  def initialize
    create_deck
    @cards.shuffle!
  end

  def create_deck
    values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
    suits = ['♦', '♠', '♥ ', '♣']
    @cards = []
    values.each do |value|
      suits.each do |suit|
        @cards << value + suit
      end
    end
  end

  def draw(user, number_of_cards)
    @cards.pop(number_of_cards)
  end

end
