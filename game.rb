class Game
  require_relative 'card'
  require_relative 'hand'
  require_relative 'deck'
  require_relative 'user'
  require_relative 'player'
  require_relative 'dealer'

  attr_reader :dealer, :player, :deck

  def initialize(dealer = Dealer.new, player = Player.new)
    @dealer = dealer
    @player = player
  end


  loop do
    deck = Deck.new
    players_hand = Hand.new
    dealers_hand = Hand.new

    deck.draw(players_hand, 2)
    deck.draw(dealers_hand, 2)
    

    show_points_cards(players_hand) {dealers_hand.secret_cards}

    player.make_a_bet(10)
    dealer.make_a_bet(10)
    puts LINE


    main_action(dealer, player, players_hand, dealers_hand, deck)
    open_points_cards(dealers_hand, players_hand)

    puts LINE
    total(dealer, player, dealers_hand, players_hand)
    print "Хотите играть ещё? [д/н] "
    choice = gets.chomp
    puts "Ваш выигрыш составил #{player.own_bank - 100}$" if choice == "н"
    break if choice == "н"
  end



    def total(dealer, player, dealers_hand, players_hand)
      if (dealers_hand.points > players_hand.points) && dealers_hand.points <= 21\
      || (players_hand.points > 21)
        puts "Вы проиграли 10 долларов("
        dealer.take_money(20)
      elsif dealers_hand.points == players_hand.points
        puts "Ничья"
        dealer.take_money(10)
        player.take_money(10)
      else
        puts "#{player.name} won 20$!"
        player.take_money(20)
      end
    end

    def show_points_cards(players_hand)
      puts "\nВаши карты: "
      players_hand.open_cards
      puts "Ваши очки: #{players_hand.points}"
      puts "\nКарты диллера: "
      yield
    end

    def open_points_cards(dealers_hand, players_hand)
      show_points_cards(players_hand) do
        dealers_hand.open_cards
        puts "Очки дилера: #{dealers_hand.points}"
      end
    end

    def main_action(dealer, player, players_hand, dealers_hand, deck)
      loop do
        break if (players_hand.cards.size == 3) && (dealers_hand.cards.size == 3)
        print USERS_CHOICE_MENU
        choice = gets.chomp.to_i
        break if choice == 3
        player.actions(choice, players_hand, dealers_hand, deck)
        puts LINE
        dealer.actions(dealers_hand, deck)
      end
    end


end
