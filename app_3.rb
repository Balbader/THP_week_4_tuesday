require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


puts "-------------------------------------------------"
puts "|   Bienvenue sur 'ILS VEULENT TOUS MA POO' !   |"
puts "|             Survie pour gagner !              |"
puts "-------------------------------------------------"

print "Quel est ton nom ? "
human_name = gets.chomp
puts "Bonjour #{human_name} !"

new_round = Game.new(human_name)
while new_round.is_still_ongoing?
  new_round.menu
  new_round.menu_choice
  new_round.show_players
  new_round.enemies_attack
  new_round.show_players
end
new_round.end
