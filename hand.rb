class Hand
  attr_accessor :cards, :points

  def initialize
    @cards = []
    @points = 0
  end

  def points
    @cards.each do |card|
      @points += card.value
      @points += 10 if (card.rank == "A") && (@points + 10 <= 21)
    end
  end

  def secret_cards
    @cards.length.times { print "* " }
  end

  def open_cards
    print @cards.join' '
  end
end
