class Player < User
  def actions(choice, dealer, deck, interface)
    case choice
    when 1 then interface.pass
    when 2
      if self.hand.cards.size != 3
        deck.draw(self.hand, 1)
        interface.show_points_cards(self) {interface.secret_cards(dealer)}
      else
        interface.full_hands
      end
    end
  end
end
