# frozen-string-literal: true

require_relative 'card'
require_relative 'deck'
require_relative 'player'

class BlackJack

  def initialize
    @players = []
    @bank = 0
    @gamer = nil
    @dealer = Dealer.new
    @players << @dealer
  end
  
  def new_game
    puts "Введите своё имя"
    @gamer = $stdin.gets.chomp
    @players << Gamer.new(@gamer)
  end
  
  def bets
    @players.each { |player| player.bet}
    @bank += 20
  end

  def win(player)
    @bank = 0
    @players(player).win
  end

  def draw
    @bank = 0
    @players.each { |player| player.draw}
  end

end

BlackJack.new.start