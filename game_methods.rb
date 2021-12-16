module GameMethods
  def total
    if (dealer.points > player.points) ||  (player.points > 21)
      puts "Вы проиграли("
      #деньги дилеру
    elsif dealer.points == player.points
      puts "Ничья"
      #деньги банка пополам
    else
      puts "You won!"
      #деньги игроку
    end
  end

  
end
