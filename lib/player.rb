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

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initializer(name)
    @weapon_level = 1

    super
    @life_points = 100
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    weapon_level = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{weapon_level}"
    if weapon_level > @weapon_level
      @weapon_level = weapon_level
      puts"Youhou! elle est meilleure que ton arme actuelle: tu la prends."
    else
      puts "M@*$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_healllth_pack
    life_points = rand(1..6)
    if life_points == 1
      puts "Tu n'as rien trouvé..."
    end
    if (life_points > 1) && (life_points < 6)
      puts "Bravo tu as trouvé un pack de +50 points de vie!"
      @life_points = @life_points + 50
      if @life_points > 100
        @life_points = 100
      end
    end
    if life_points == 6
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
      @life_points = @life_points + 80
      if @life_points > 100
        @life_points = 100
      end
    end
  end
end
