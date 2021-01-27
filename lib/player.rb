require 'bundler'
Bundler.require

class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
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
    player.gets_damage(nb)
    puts "Le joueur #{@name} a infligé #{nb} de damages au joueur #{player.name}"
  end

end

class HumanPlayer < Player
  attr_accessor :weapon_level
  attr_accessor :life_points

  def initialize(name)
    super(name)
    @weapon_level = 1
    @life_points = 100
  end

  def show_state
    puts "#{@name} a #{@life_points.to_i} points de vie et une arme de niveau #{@weapon_level.to_i}"
  end

  def compute_damage
    return rand(1..6) * @weapon_level.to_i
  end

  def search_weapon
    weapon_rand = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{weapon_rand}"
    if weapon_rand > @weapon_level.to_i
      puts"Youhou! elle est meilleure que ton arme actuelle: tu la prends."
      return @weapon_level = weapon_rand
    else
      puts "M@*$... elle n'est pas mieux que ton arme actuelle..."
      return @weapon_level
    end
  end

  def search_health_pack
    points = rand(1..6)
    if points == 1
      puts "Tu n'as rien trouvé..."
    end
    if (points > 1) && (points < 6)
      puts "Bravo tu as trouvé un pack de +50 points de vie!"
      @life_points = @life_points + 50
      if @life_points > 100
        @life_points = 100
      end
    end
    if points == 6
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
      @life_points = @life_points + 80
      if @life_points > 100
        @life_points = 100
      end
    end
  end
end
