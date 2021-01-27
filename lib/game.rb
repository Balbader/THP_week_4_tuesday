require 'bundler'
Bundler.require

require_relative 'player'

class Game
  attr_accessor :human_player, :enemies

  def initialize(player)
    @human_player = HumanPlayer.new(player)
    @enemies = [Player.new("Basil"), Player.new("Youssef"), Player.new("Yann"), Player.new("Théo"), Player.new("Mehdi"), Player.new("Charles")]
  end

  def show_players
    @human_player.show_state
    i = 0
    while i < @enemies.length
      @enemies[i].show_state
      i += 1
    end
  end
  
  def kill_player
    i = 0
    while i < @enemies.length
      if i.life_points <= 0
        @enemies[i].delete
      end
      i += 1
    end
  end

  def is_still_ongoing?
    @human_player.life_points > 0 && !@enemies.empty? ? true : false
  end

  #------ Print Menu + state of enemy ------#
  def menu
    puts "-------------------------------------------------"
    puts "Quelle action veux-tu effectuer ? "
    puts
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner "
    puts
    puts "attaquer un joueur en vue :"
    i = 0
    while i < @enemies.length
      print "#{@enemies[i].name} = "
      print "#{@enemies[i].show_state}"
      i += 1
    end
  end

  def menu_choice(str)
    puts "Faites votre choix :"
    print "> "
    str = gets.chomp
    puts "-------------------------------------------------"
    if str == "a"
      @human_player.search_weapon
    end
    if str == "s"
      @human_player.search_health_pack
    end
    #si str != a ou s--> recup the spot of the enemy to kill
    if str == "0" || str == "1" || str == "2" || str == "3"
      spot = str.to_i
      if spot <= @enemies.count - 1 #ennemi to be killed aka off the array
      @human_player.attack(enemies[spot])
        if @enemies[spot].life_points <= 0
          kill_player
        end
      end
    end
  end

  def enemies_attack
    #each enemy will attack human one after the other
    puts "-------------------------------------------------"
    puts "Les autres joueurs t'attaquent!"
    i = 0
    while i < @enemies.length
      if @enemies[i].life_points > 0
        @enemies[i].attack(@human_player)
      else
        kill_player(@enemies[i])
      end
      i += 1
    end
  end
  
  def end
    puts "-------------------------------------------------"
    if @human_player.life_points > 0
      puts "x_x  BRAVO! TU AS GAGNE!  x_x"
    else
      puts "---  LOSER! TU AS PERDU!  ---"
    end
    puts "-------------------------------------------------"
  end
end
