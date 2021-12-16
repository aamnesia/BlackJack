class Player < User
  attr_reader :name

  def initialize
    @name = get_name
  end

  private

  def get_name
    print "Ваше имя: "
    gets.chomp
  end
end
