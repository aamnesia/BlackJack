class Player < User
  def initialize(name = get_name)
    @name = name
    super
  end

  def get_name
    print "Ваше имя: "
    gets.chomp
  end

  def actions(choice, users_hand, dealers_hand)
    case choice
    when 1 then "Dealer's turn"
    when 2
      deck.draw(users_hand, 1)
      show_points_cards {dealers_hand.secret_cards}
    when 3 then
      open_points_cards(dealers_hand)
      break
    end
  end
end
