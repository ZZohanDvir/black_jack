# frozen-string-literal: true

require_relative 'player'

class Dealer < Player
  def initialize
    super
    @name = 'Дилер'
  end

  def should_pass?
    @hand.total >= 17
  end
end
