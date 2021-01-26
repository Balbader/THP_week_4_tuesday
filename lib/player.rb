require 'bundler'
Bundler.require

class Player
  attr_accessor :name, :life_points

  def initialize(name)
    life_points = 10
    @name = name
    @life_points = life_points
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie"
    if @life_points <= 0
      puts "Le joueur #{@name} a été tué!"
      puts "#{@name} a 0 points de vie"
    end
  end

  def gets_damage(nb)
    @life_points -= nb
    if @life_points <= 0
      puts "Le joueur #{@name} a été tué!"
      puts "#{@name} a 0 points de vie"
    else
      show_state
    end
  end

  def compute_damage
    return rand(1..6)
  end

  def attack(player)
    puts "Le joueur #{@name} attaque le joueur #{player.name}" 
    nb = compute_damage
    puts "Le joueur #{@name} a infligé #{nb} de damages au joueur #{player.name}"
    player.gets_damage(nb)
  end

end
