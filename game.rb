require_relative 'game_methods'
require_relative 'card'
require_relative 'hand'
require_relative 'deck'
require_relative 'user'
require_relative 'player'
require_relative 'dealer'

include GameMethods

dealer = Dealer.new
player = Player.new

loop do
  deck = Deck.new
  players_hand = Hand.new
  dealers_hand = Hand.new

  deck.draw(players_hand, 2)
  deck.draw(dealers_hand, 2)

  show_points_cards(players_hand) {dealers_hand.secret_cards}

  player.make_a_bet(10)
  dealer.make_a_bet(10)

  unless (players_hand.cards.size == 3) && (dealers_hand.cards.size == 3)
    main_action(dealer, player)
  else
    open_points_cards(dealers_hand)
  end

  total(dealer, player)
  print "Хотите играть ещё? [д/н] "
  break if gets.chomp == "н"
end
