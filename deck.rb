# frozen-string-literal: true

require_relative 'card'
require_relative 'player'

class Deck
  attr_accessor :cards

  FACES = [*(2..10), 'J', 'Q', 'K', 'A'].freeze
  SUITS = ['♠', '♣', '♥', '♦'].freeze

  def initialize
    @cards = []
    build
  end

  def build
    FACES.each do |face|
      case face
      when Integer
        value = face
      when 'A'
        value = 11
      else
        value = 10
      end
      SUITS.each do |suit|
        @cards << Card.new(face, suit, value)
      end
    end
    @cards.shuffle!.shuffle!
  end
end
