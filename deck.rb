# frozen-string-literal: true

class Deck

  attr_accessor :cards

  FACES = [:2, :3, :4, :5, :6, :7, :8, :9, :10, :J, :Q, :K, :A]
  SUITS = [:<>, :^, :+. :<3]

  def initialize
    @cards = []
  end

  def build
    SUITS.each do |suit|
      FACES.each { |face| @cards << Card.new(face, suit) }
    end
    @cards.shuffle
  end
  
  def give_card(player)
    player.hand << @cards.shift
  end

end