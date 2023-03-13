# frozen-string-literal: true

require_relative 'card'
require_relative 'dealer'
require_relative 'deck'
require_relative 'player'

class BlackJack
  def initialize
    @players = []
    @bank = 0
    @gamer = nil
    @dealer = Dealer.new
    @players << @dealer
    @deck = Deck.new
  end

  def new_game
    puts 'Введите своё имя'
    @gamer = $stdin.gets.chomp
    @players << Player.new(@gamer)
    puts "Здравствуйте, #{@players[1].name}! Давайте начнем игру."
  end

  def first_round
    2.times { players.each(:&take_card) }
    puts 'Ваши карты:'
    @players[1]
      .def bets
    @players.each(:&bet)
    @bank += 20
  end

  def win(winner)
    @bank = 0
    @players.each { |player| player.win if player.name == winner.name }
  end

  def draw
    @bank = 0
    @players.each(:&draw)
  end
end

# BlackJack.new.new_game
