class Dealer < User
  def actions(deck, interface)
    if self.hand.points >= 17
      interface.pass
    elsif self.hand.cards.size != 3
      deck.draw(self.hand, 1)
      interface.took_card
    end
  end
end
