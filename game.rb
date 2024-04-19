require './player'

class Game
  attr_reader :players

  def initialize(player1, player2)
    @players = [Player.new(player1), Player.new(player2)]
    @current_player = 0
  end

  def start
    puts "Let's start!"
    loop do
      break if game_over

      question = generate_question
      current_player = @players[@current_player]
      answer = current_player.answer_question(question)

      current_player.update_lives(answer)
      display_lives
      switch_player
    end
    display_winner
  end

  def generate_question
    num1 = rand(1..20)
    num2 = rand(1..20)
    { 
      question: "#{num1} + #{num2}",
      answer: num1 + num2
    }
  end

  def switch_player
    @current_player = (@current_player + 1) % 2
  end

  def game_over
    @players.any? { |player| player.lives <= 0 }
  end

  def display_lives
    @players.each do |player|
      puts "#{player.name}: #{player.lives} lives remaining"
    end
    puts "---------------------"
  end

  def display_winner
    winner = @players.find { |player| player.lives > 0 }
    puts "#{winner.name} wins with #{winner.lives} lives remaining!"
  end
end