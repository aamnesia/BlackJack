class Game
  require_relative 'card'
  require_relative 'hand'
  require_relative 'deck'
  require_relative 'user'
  require_relative 'player'
  require_relative 'dealer'
  require_relative 'game_methods'

  attr_reader :dealer, :player, :interface

  def initialize
    @dealer = Dealer.new
    @interface = Interface.new
    @player = Player.new(@interface.get_name)
  end


  def play_game
    loop do
      start_game
      @interface.show_points_cards(@player) {@interface.secret_cards(@dealer)}
      main_action if (@player.hand.score != 21) || (@dealer.hand.score != 21)
      @interface.open_points_cards(@dealer, @player)
      total
      break if !@interface.play_again?(@player)
    end
  end

  def start_game
    @deck = Deck.new
    @deck.draw(@player.hand, 2)
    @deck.draw(@dealer.hand, 2)
    @player.make_a_bet(10)
    @dealer.make_a_bet(10)
  end

  def total
    if (@dealer.hand.points > @player.hand.points) && @dealer.hand.points <= 21\
    || (@player.hand.points > 21)
      output = 1
      @dealer.take_money(20)
    elsif @dealer.hand.points == @player.hand.points
      output = 2
      @dealer.take_money(10)
      @player.take_money(10)
    else
      output = 3
      @player.take_money(20)
    end
    @interface.total_output(output)
  end

  def main_action
    choice = @interface.users_choice
    unless choice == 3
      @player.actions(choice, @dealer, @deck, @interface)
      @dealer.actions(@deck, @interface)
    end
  end
end
Game.new.play_game
