require 'bundler'
Bundler.require

require_relative 'player'

class Game
  attr_accessor :human_player, :enemies

  def initialize(player)
    @human_player = HumanPlayer.new(player)
    @enemies = [Player.new("Basil"), Player.new("Youssef"), Player.new("Yann"), Player.new("Théo"), Player.new("Mehdi"), Player.new("Charles")]
  end
  
  def kill_player
    i = 0
    while i < @enemies.length
      if i.life_points <= 0
        @enemies.delete(i)
      end
      i += 1
    end
  end

  def is_still_ongoing?
    if @human_player.life_points > 0 && !@enemies.empty?
      return true
    else
      return false
    end
  end

  def show_players
    @human_player.show_state
    puts "Nombre d'ennemis en vie: #{@enemies.count}"
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
      if enemies.life_points > 0
        print "#{i} - "
        @enemies[i].show_state
      end
      i += 1
    end
  end

  def menu_choice(str)
    puts "Alors??"
    str = gets.chomp
    puts "-------------------------------------------------"
    if str == "a"
      @human_player.search.weapon
    end

    if str == "s"
      @human_player.search_health_pack
    end
    #si str != a ou s--> recup the spot of the enemy to kill
    if str == "0" || str == "1" || srt == "2" || str == "3"
      spot = str.to_i
      if spot <= @enemies.count - 1 #ennemi to be killed aka off the array
        if @enemies[spot].life_points > 0
          @human_player.attack(enemies[spot])
          kill_player
        end
      else
        puts "Mauvais cheval, tant pis pout toi!"
      end
    else
      puts "Erreur de saisie: a ou s ou un chiffre de 0 a 3..."
    end
  end

  def enemies_attack
    #each enemy will attack human one after the other
    puts "-------------------------------------------------"
    puts "Vous vous faites attaquer!!!"
    i = 0
    while i < @enemies.length
      if i.life_points > 0
        i.attack(@human_player)
      end
      i += 1
    end
  end
  
  def end
    puts "-------------------------------------------------"
    puts "*_*  La partie est finie!  *_*"
    if @human_player.life_points > 0
      puts "BRAVO! TU AS GAGNE!"
    else
      puts "LOSER! TU AS PERDU!"
    end
    puts "-------------------------------------------------"
  end



end



































