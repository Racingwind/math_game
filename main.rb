require "./game"

puts "Math Challenge - The game"
print "Player 1, enter your name: "
player1 = gets.chomp
print "Player 2, enter your name: "
player2 = gets.chomp
game = Game.new(player1, player2)
game.start