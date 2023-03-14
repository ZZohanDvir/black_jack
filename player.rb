# frozen-string-literal: true

require_relative 'card'
require_relative 'deck'

class Player
  BET = 10
  BANK = 20

  attr_reader :name, :total
  attr_accessor :hand, :money

  def initialize(name)
    @name = name
    @hand = []
    @money = 100
    @total = 0
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
    current_total
  end

  def show_cards
    @hand.each { |card| puts "#{card.face}#{card.suit}" }
  end

  def hide_cards
    @hand.each { |card| card.hide }
  end

  def out_of_money?
    @money.zero?
  end

  def current_total
    @total = 0
    @hand.each do |card|
      @total += card.value
    end
    ace_to_lose?
  end

  protected

  def ace?
    @hand.each { |card| card.face }.include?('A')
  end

  def ace_to_lose?
    @total -= 10 if ace? && @total > 21
  end
end
