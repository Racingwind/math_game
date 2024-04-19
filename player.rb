class Player
  attr_reader :name, :lives

  def initialize(name)
    @name = name
    @lives = 3
  end

  def answer_question(question)
    puts "#{@name}, what is #{question[:question]}?"
    answer = gets.chomp.to_i
    answer == question[:answer]
  end

  def update_lives(correct)
    @lives -= 1 unless correct
  end
end