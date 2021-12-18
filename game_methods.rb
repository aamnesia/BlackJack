USERS_CHOICE_MENU = "
  Выберите действие
1 - Пас
2 - Взять карту
3 - Открыть карты
>>> "


module GameMethods
  def total(dealer, player)
    if (dealer.points > player.points) ||  (player.points > 21)
      puts "Вы проиграли("
      dealer.take_money(20)
    elsif dealer.points == player.points
      puts "Ничья"
      dealer.take_money(10)
      dealer.take_money(10)
    else
      puts "You won!"
      player.take_money(20)
    end
  end

  def show_points_cards(players_hand)
    print "#{player.name}, Ваши карты: "
    players_hand.open_cards
    print "Ваши очки: "
    players_hand.points
    print "Карты диллера: "
    yield
  end

  def open_points_cards(dealers_hand)
    show_points_cards do
      dealers_hand.open_cards
      print "Очки дилера: "
      dealers_hand.points
    end
  end

  def main_action(dealer, player)
    loop do
      print USERS_CHOICE_MENU
      choice = gets.chomp.to_i
      player.actions(choice, users_hand, dealers_hand)
      dealer.actions(dealers_hand, deck)
    end
  end
end
