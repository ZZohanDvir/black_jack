# frozen-string-literal: true

class Card
  attr_accessor :value
  attr_reader :face, :suit

  def initialize(face, suit, value)
    @face = face
    @suit = suit
    @value = value
  end

  def show
    "#{@face}#{@suit}"
  end

  def hide
    '*'
  end
end
