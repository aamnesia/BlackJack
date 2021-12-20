class Player < User
  def initialize(name = get_name)
    @name = name
    super
  end

  def get_name
    print "Ваше имя: "
    gets.chomp
  end

  def actions(choice, players_hand, dealers_hand, deck)
    case choice
    when 1 then puts "Пас"
    when 2
      if players_hand.cards.size != 3
        deck.draw(players_hand, 1)
        show_points_cards(players_hand) {dealers_hand.secret_cards}
      else
        puts "Карты уже взяты"
      end
    #when 3 then open_points_cards(dealers_hand, players_hand)
    #карты откроются после выхода из цикла main_action
    end
  end
end
