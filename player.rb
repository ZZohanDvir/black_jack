# frozen-string-literal: true

class Player
  
  attr_reader :name
  attr_accessor :hand, :money
  
  def initialize(name)
    @name = name
    @hand = []
    @money = 100
  end

  def bet
    @money -= 10
  end

  def win
    @money += 20
  end

  def draw
    @money += 10
  end

  
end