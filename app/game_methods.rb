class Interface
  USERS_CHOICE_MENU = "
    Выберите действие
  1 - Пас
  2 - Взять карту
  3 - Открыть карты
  >>> "

  LINE = "=" * 20

  def get_name
    print "Ваше имя: "
    gets.chomp
  end

  def secret_cards(dealer)
    dealer.hand.cards.length.times { print "**  " }
    print "\n"
  end

  def open_cards(user)
    user.hand.cards.each { |card| print "#{card.show_card} "}
    print "\n"
  end

  def total_output(output)
    puts case output
      when 1 then "Вы проиграли 10 долларов("
      when 2 then "Ничья"
      when 3 then "You won 20$!"
    end
  end

  def show_points_cards(player)
    puts "\nВаши карты: "
    open_cards(player)
    puts "Ваши очки: #{player.hand.points}"
    puts "\nКарты диллера: "
    yield
    puts LINE
  end

  def open_points_cards(dealer, player)
    show_points_cards(player) do
      open_cards(dealer)
      puts "Очки дилера: #{dealer.hand.points}"
    end
    puts LINE
  end

  def play_again?(player)
    print "Хотите играть ещё? [д/н] "
    choice = gets.chomp
    puts "Ваш выигрыш составил #{player.own_bank - 100}$" if choice == "н"
    false if choice == "н"
    true if choice == "д"
  end

  def pass
    puts "Пас"
    puts LINE
  end

  def full_hands
    puts "Карты уже взяты"
    puts LINE
  end

  def took_card
    puts "Диллер взял карту"
  end

  def users_choice
    print USERS_CHOICE_MENU
    choice = gets.chomp.to_i
  end

end
