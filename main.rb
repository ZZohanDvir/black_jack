# frozen-string-literal: true

require_relative 'card'
require_relative 'dealer'
require_relative 'deck'
require_relative 'player'

class BlackJack
  attr_accessor :players, :bank, :deck

  def initialize
    @players = []
    @bank = 0
    @dealer = Dealer.new
    @players << @dealer
    @deck = nil
  end

  def new_game
    puts 'Введите своё имя'
    @gamer = $stdin.gets.chomp
    @players << Player.new(@gamer)
    puts "Здравствуйте, #{@players[1].name}! Давайте начнем игру."
    first_round
  end

  def first_round
    @deck = Deck.new
    bets
    @players.each { |player| player.hand = [] }
    2.times { players.each { |player| player.take_card(@deck) } }
    puts "Ваши карты: #{@players[1].show_cards}. Сумма очков: #{@players[1].total}"
    puts "Карты дилера: #{@players[0].hide_cards}"
    second_round
  end

  def second_round
    puts '1 - сдать еще карту
    2 - пасс'
    choice = $stdin.gets.chomp.to_i
    case choice
    when 1
      @players[1].take_card(@deck)
      @players[0].take_card(@deck) unless @players[0].should_pass?
    when 2
      @players[0].take_card(@deck) unless @players[0].should_pass?
    end
    puts "Ваши карты: #{@players[1].show_cards}. Сумма очков: #{@players[1].total}"
    puts "Карты дилера: #{@players[0].show_cards}. Сумма очков: #{@players[0].total}"
    final
  end

  def final
    who_win?
    puts "Ваш остаток: #{@players[1].money}"
    puts "Остаток дилера: #{@players[0].money}"
    if continue?
      first_round
    else
      game_over
    end
  end

  def who_win?
    if both_lost? || draw?
      draw
      puts 'Ничья!'
    elsif dealer_lost?
      player_win
      puts 'Вы выиграли!'
    else
      dealer_win
      puts 'Дилер выиграл'
    end
  end

  def continue?
    abort 'Игра окончена. Победа за Вами!' if @players[0].out_of_money?
    abort 'Игра окончена. Дилер взял верх!' if @players[1].out_of_money?
    puts 'Сыграем еще?
    1 - да
    2 - нет'
    choice = $stdin.gets.chomp.to_i
    case choice
    when 1
      true
    when 2
      game_over
    end
  end

  def game_over
    abort 'Спасибо за игру!'
  end

  def bets
    @players.each { |player| player.bet }
    @bank += 20
  end

  def draw?
    @players[1].total == @players[0].total
  end

  def draw
    @bank = 0
    @players.each { |player| player.draw }
  end

  def player_lost?
    if @players[1].total > 21
      true
    elsif @players[0].total > @players[1].total && @players[0].total < 21
      true
    else
      false
    end
  end

  def dealer_lost?
    if @players[0].total > 21
      true
    elsif @players[1].total > @players[0].total && @players[1].total < 21
      true
    else
      false
    end
  end

  def both_lost?
    player_lost? && dealer_lost?
  end

  def player_win
    @players[1].win
    @bank = 0
  end

  def dealer_win
    @players[0].win
    @bank = 0
  end
end

BlackJack.new.new_game
