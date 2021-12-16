class Dealer < User
  attr_reader :name

  def initialize
    @name = "Dealer"
  end
end
