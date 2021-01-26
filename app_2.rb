require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def welcome
  puts "-------------------------------------------------"
  puts "|   Bienvenue sur 'ILS VEULENT TOUS MA POO' !   |"
  puts "|Le but du jeu est d'être le dernier survivant !|"
  puts "-------------------------------------------------"
end

def create_player
  puts "Enter Prénom: "
  print "> "
  name = gets.chomp
  puts "Bienvenu #{name}!"
  player_a = Player.new(name)
  puts "Voici ton profil:"
  puts player_a.name
end

create_player
