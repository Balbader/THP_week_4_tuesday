require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#------ Welcome participant ------#
def welcome
  puts "-------------------------------------------------"
  puts "|   Bienvenue sur 'ILS VEULENT TOUS MA POO' !   |"
  puts "|Le but du jeu est d'être le dernier survivant !|"
  puts "-------------------------------------------------"
end
welcome

#------ Create human player ------#
puts "Enter Prénom: "
print "> "
name = gets.chomp
puts "Bienvenu #{name}!"
human = HumanPlayer.new(name)
puts "Voici ton profil:"

#------  Initiate ennemies  ------#
ennemies = Array.new
enn_1 = Player.new("Josiane")
enn_2 = Player.new("José")
ennemies << enn_1
ennemies << enn_2
round = 1

#------  Initiate battle  ------#
while human.life_points > 0 && (enn_1.life_points > 0 || enn_2.life_points > 0)
  #afficher status joueur
  human.show_state

  puts
  puts
  puts "===================  ROUND #{round.to_s}  ==================="
  puts
  puts

  #afficher Menu
  puts "Quelle action veut-tu effectuer?"
  puts
  puts "a - chercher une meilleure arme"
  puts "s - chercher a se soigner"
  puts
  puts "attaquer un joueur en vue:"

  #afficher status bots
  if enn_1.life_points > 0
    print "0 - "
    enn_1.show_state
  end
  if enn_2.life_points > 0
    print "1 - "
    enn_2.show_state
  end
  puts
  puts "Quel est votre choix?"
  choice = gets.chomp
  puts "-------------------------------------------------"

  #definir la selection
  if choice == "a"
    human.search_weapon
  end
  if choice == "s"
    human.search_health_pack
  end
  if choice == "0" && enn_1.life_points > 0
    human.attack(enn_1)
  end
  if choice == "1" && enn_2.life_points > 0
    human.attack(enn_2)
  end

  #ennemies payback
  if enn_1.life_points > 0 && enn_2.life_points > 0
    puts "Les autres joueurs t'attaquent!"
  end
  i = 0
  while i < ennemies.length
    if ennemies[i].life_points > 0
      ennemies[i].attack(human)
    end
    i += 1
  end
  round += 1
end
puts "-------------------------------------------------"
puts
if human.life_points > 0
  puts "x_x BRAVO! TU AS GAGNE! x_x"
else
  puts "xxx TU AS PERDU :_( xxx"
end
