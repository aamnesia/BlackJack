class Dealer < User
  def actions(dealers_hand, deck)
    if dealers_hand.points >= 17
      puts "Пас"
    elsif dealers_hand.cards.size != 3
      deck.draw(dealers_hand, 1)
      puts "Диллер взял карту"
    end
  end
end
