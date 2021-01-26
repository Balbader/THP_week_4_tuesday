require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

Player
player1 = Player.new("Josiane")
player2 = Player.new("José")

i = 1
while player1.life_points > 0 && player2.life_points > 0
  puts "Bienvenu aux competiteurs:"
  puts
  player1.show_state
  player2.show_state
  puts
  puts "-----------------------------------------"
  puts
  puts "Passons a la phase d'attaque numéro #{i}:"
  puts
  player1.attack(player2)
  if player2.life_points <= 0
    break
  end
  player2.attack(player1)
  if player1.life_points <= 0
    break
  end
  puts
  i += 1
end
