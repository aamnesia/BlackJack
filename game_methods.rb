USERS_CHOICE_MENU = "
  Выберите действие
1 - Пас
2 - Взять карту
3 - Открыть карты
>>> "

LINE = "=" * 20

module GameMethods
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
