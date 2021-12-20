class Hand
  attr_accessor :cards, :score

  def initialize
    @cards = []
  end

  def points
    @score = 0
    @cards.each do |card|
      @score += card.value
      @score += 10 if (card.rank == "A") && (@score + 10 <= 21)
    end
    @score
  end

  def secret_cards
    @cards.length.times { print "**  " }
    print "\n"
  end

  def open_cards
    @cards.each { |card| print "#{card.show_card} "}
    print "\n"
  end
end
