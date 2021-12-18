class Dealer < User
  super

  def actions(dealers_hand, deck)
    if dealers_hand.points >= 17
      puts "Player's turn"
    else
      deck.draw(dealers_hand, 1)
    end
  end
end
