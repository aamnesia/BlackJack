class Interface
  USERS_CHOICE_MENU = "
    Выберите действие
  1 - Пас
  2 - Взять карту
  3 - Открыть карты
  >>> "

  LINE = "=" * 20

  def ask_name
    print "Ваше имя: "
    gets.chomp
  end

  def greeting(player, dealer)
    puts "Игра началась! #{player.name} VS #{dealer.name}"
  end

  def ending
    puts "Game over"
  end

  def want_to_play?(player)
    print "Want to play? [y/n] "
    choice = gets.chomp
    if choice == "n"
      puts "Ваш выигрыш составил #{player.own_bank - 100}$"
      false
    elsif choice == "y"
      true
    end
  end

  def start_game_message
    puts "Мешаем карты, раздаем, делаем ставки.."
    sleep(2)
  end

  def open_cards(hand)
    hand.cards.each { |card| print "#{card.show_card} "}
    print "\n"
  end

  def secret_cards(dealer_hand)
    dealer_hand.cards.length.times { print "**  " }
    print "\n"
  end

  def show_hands(player_hand, dealer_hand, show_all: false)
    puts "\nВаши карты: "
    open_cards(player_hand)
    puts "Ваши очки: #{player_hand.points}"
    puts "\nКарты диллера: "
    if show_all
      open_cards(dealer_hand)
      puts "Очки дилера: #{dealer_hand.points}"
    else
      secret_cards(dealer_hand)
    end
    puts LINE
  end

  def pass
    puts "Пас"
    puts LINE
  end

  def full_hands
    puts "Карты уже взяты"
  end

  def took_card(user)
    puts "#{user.name} взял карту"
  end

  def opening_cards
    puts "Открываем карты"
  end

  def users_choice
    print USERS_CHOICE_MENU
    gets.chomp.to_i
  end

  def recalculating
    puts "Подводим итоги.."
    sleep(2)
  end

  def dealer_won
    puts "Вы проиграли 10 долларов :("
  end

  def dead_heat
    puts "Ничья"
  end

  def player_won(player)
    puts "#{player.name}, you won 20$!"
  end
end
