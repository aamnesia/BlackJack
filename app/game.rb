class Game
  attr_reader :dealer, :player
  attr_accessor :player_hand, :dealer_hand

  def initialize
    @dealer = User.new
    @player = User.new
    @interface = Interface.new
  end

  def play_game
    set_playername
    while @interface.want_to_play?(@player) do
      @interface.greeting(@player, @dealer)
      start_game
      @interface.show_hands(@player_hand, @dealer_hand)
      main_action
      @interface.show_hands(@player_hand, @dealer_hand, show_all: true)
      total
      @interface.ending
    end
  end

  def set_playername
    @player.name = @interface.ask_name
  end

  def start_game
    @interface.start_game_message
    @deck = Deck.new
    @player_hand = Hand.new
    @dealer_hand = Hand.new
    @deck.draw(@player_hand, 2)
    @deck.draw(@dealer_hand, 2)
    @player.make_a_bet(10)
    @dealer.make_a_bet(10)
  end

  def players_turn(choice)
    case choice
    when 1 then @interface.pass
    when 2
      if @player_hand.cards.size != 3
        @deck.draw(@player_hand, 1)
        @interface.took_card(@player)
        @interface.show_hands(@player_hand, @dealer_hand)
      else
        @interface.full_hands
      end
    end
  end

  def dealers_turn
    if @dealer_hand.points >= 17
      @interface.pass
    elsif @dealer_hand.cards.size != 3
      @deck.draw(@dealer_hand, 1)
      @interface.took_card(@dealer)
    end
  end

  def main_action
    loop do
      choice = @interface.users_choice
      return @interface.opening_cards if choice == 3
      players_turn(choice)
      sleep(2)
      return @interface.opening_cards if (@player_hand.cards.size == 3) \
      && (@dealer_hand.cards.size == 3)
      dealers_turn
    end
  end

  def total
    @interface.recalculating
    if (@dealer_hand.points > @player_hand.points) && @dealer_hand.points <= 21\
    || (@player_hand.points > 21)
      @interface.dealer_won
      @dealer.take_money(20)
    elsif @dealer_hand.points == @player_hand.points
      @interface.dead_heat
      @dealer.take_money(10)
      @player.take_money(10)
    else
      @interface.player_won(@player)
      @player.take_money(20)
    end
  end
end
