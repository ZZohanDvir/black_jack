# frozen-string-literal: true

require_relative 'card'

class Player
  
  BET = 10.freeze
  BANK = 20.freeze
  
  attr_reader :name
  attr_accessor :hand, :money, :hand_value
  
  def initialize(name)
    @name = name
    @hand = []
    @money = 100
    @hand_value = 0
  end

  def bet
    @money -= BET
  end

  def win
    @money += BANK
  end

  def draw
    @money += BET
  end

  def take_card(deck)
    @hand << deck.cards.shift
    current_value
    ace_to_lose?
  end

  def enough?
    @hand.size == 3
  end

  protected

  def ace?
    @hand.map(:&face).include?('A')
  end

  def current_value
    @hand_value = @hand.map(:&value).sum
  end

  def ace_to_lose?
    @hand_value -=10 if ace? && @hand_value > 21
  end
  
end