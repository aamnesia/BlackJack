class Game
  attr_reader :dealer, :player#, :interface
  attr_accessor :player_hand, :dealer_hand

  def initialize
    @dealer = User.new
    @player = User.new
    #@turn = {1: players_turn, 2: dealers_turn}
    #@interface = Interface.new
  end

  USERS_CHOICE_MENU = "
    Выберите действие
  1 - Пас
  2 - Взять карту
  3 - Открыть карты
  >>> "

  LINE = "=" * 20

  def play_game
    set_playername
    while want_to_play? do
      puts "Игра началась! #{@player.name} VS #{@dealer.name}"
      start_game
      show_hands
      main_action
      show_hands(show_all: true)
      total
      puts "Game over"
    end
  end

  def set_playername
    @player.name = ask_name
  end

  def ask_name
    print "Ваше имя: "
    gets.chomp
  end

  def want_to_play?
    print "Want to play? [y/n] "
    choice = gets.chomp
    if choice == "n"
      puts "Ваш выигрыш составил #{@player.own_bank - 100}$"
      false
    elsif choice == "y"
      true
    end
  end

  def start_game
    puts "Мешаем карты, раздаем, делаем ставки.."
    sleep(2)
    @deck = Deck.new
    @player_hand = Hand.new
    @dealer_hand = Hand.new
    @deck.draw(@player_hand, 2)
    @deck.draw(@dealer_hand, 2)
    @player.make_a_bet(10)
    @dealer.make_a_bet(10)
  end

  def open_cards(hand)
    hand.cards.each { |card| print "#{card.show_card} "}
    print "\n"
  end

  def secret_cards
    @dealer_hand.cards.length.times { print "**  " }
    print "\n"
  end

  def show_hands(show_all: false)
    puts "\nВаши карты: "
    open_cards(@player_hand)
    puts "Ваши очки: #{@player_hand.points}"
    puts "\nКарты диллера: "
    if show_all
      open_cards(@dealer_hand)
      puts "Очки дилера: #{@dealer_hand.points}"
    else
      secret_cards
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

  def players_turn(choice)
    case choice
    when 1 then pass
    when 2
      if @player_hand.cards.size != 3
        @deck.draw(@player_hand, 1)
        took_card(@player)
        show_hands
      else
        full_hands
      end
    end
  end

  def dealers_turn
    if @dealer_hand.points >= 17
      pass
    elsif @dealer_hand.cards.size != 3
      @deck.draw(@dealer_hand, 1)
      took_card(@dealer)
    end
  end

  def main_action
    loop do
      choice = users_choice
      return puts "Открываем карты" if choice == 3
      players_turn(choice)
      sleep(2)
      return puts "Открываем карты" if (@player_hand.cards.size == 3) \
      && (@dealer_hand.cards.size == 3)
      dealers_turn
    end
  end

  def users_choice
    print USERS_CHOICE_MENU
    gets.chomp.to_i
  end

  def total
    puts "Подводим итоги.."
    sleep(2)
    if (@dealer_hand.points > @player_hand.points) && @dealer_hand.points <= 21\
    || (@player_hand.points > 21)
      dealer_won
    elsif @dealer_hand.points == @player_hand.points
      dead_heat
    else
      player_won
    end
  end

  def dealer_won
    puts "Вы проиграли 10 долларов :("
    @dealer.take_money(20)
  end

  def dead_heat
    puts "Ничья"
    @dealer.take_money(10)
    @player.take_money(10)
  end

  def player_won
    puts "#{@player.name}, you won 20$!"
    @player.take_money(20)
  end
end
