# frozen-string-literal: true

class Card

  VALUES = {2: 2, 3: 3, 4: 4, 5: 5, 6: 6, 7: 7, 8: 8, 9: 9, 10: 10, J: 10, Q: 10, K: 10, A: 10}
  attr_reader :face, :suit
  
  def initialize(face, suit)
    @face = face
    @suit = suit
  end
  
  end