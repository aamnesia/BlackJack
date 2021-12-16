include GameMethods

dealer = Dealer.new
deck = Deck.new
player = Player.new

loop do
  deck.give_card(player, 2)

  deck.give_card(dealer, 2)

  total

  print "Хотите играть ещё? [д/н] "
  break if gets.chomp == "н"
end
