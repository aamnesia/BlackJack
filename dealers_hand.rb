class DealersHand < Hand
  super
  def show_cards
    @cards.length.times { print "* "}
  end
end
