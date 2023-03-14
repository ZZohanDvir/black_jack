# frozen-string-literal: true

require_relative 'player'

class Dealer < Player
  def initialize(name = 'Дилер')
    super
  end

  def should_pass?
    @total >= 17
  end
end
