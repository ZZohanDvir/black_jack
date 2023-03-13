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
      value = case face
              when Integer
                face
              when 'A'
                11
              else
                10
                SUITS.each do |suit|
                  @cards << Card.new(face, suit, value)
                end
              end
    end
    @cards.shuffle!
  end
end
