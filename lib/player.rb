class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    "Le joueur #{name} à #{life_points} points de vie"
  end

  def gets_damage(damage_points) #méthode pas en privée car sera utilisée indirectement sur un objet via #attacks(victim)
    @life_points -= damage_points
    puts "\n\nLe joureur #{name} a été tué !\n\n" if still_alive? == false
  end

  def attacks(victim)
    puts "Le joureur #{name} attaque le joueur #{victim.name}"
    damages = compute_damage
    puts "Il lui inflige #{damages} points de dommages !\n\n"
    victim.gets_damage(damages)
  end

private #méthodes mises en privées utiles aux fonctionnement des méthodes publiques mais ne doivent pas être
        #sensé s'appliquer sur les objets.
  def still_alive?
    life_points <= 0 ? false : true   #là la methode still_alive ne sera pas appelée direct sur un objet et
  end                                 #ne contient pas non plus une mehtode qui sera appliquée sur un objet:
                                    #c'est le contenu de life_point qui est utilisé pour le if de gets_damage
  def compute_damage
    rand(1..6)
  end
end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    super(name)       #super au début de la def pour "ré-écrire" la variable @life_points, si non on charge celle de la class mère
    @weapon_level = 1
    @life_points = 100
  end

  def show_state
    puts "\n\n#{name} a #{life_points} points de vie, et une arme de niveau #{weapon_level}\n\n"
  end

  def search_weapon
    dice = rand(1..6)
    puts "Tu viens de trouver une arme de niveau #{dice}"
    if dice > weapon_level
      @weapon_level = dice
      puts "Youhou elle est meilleur que mon arme actuelle ! Je la garde !\n\n"
    else
      puts "C'est de la M*#d@ ! Je garde la mienne !\n\n"
    end
  end

  def search_health_pack
    dice = rand(1..6)
    case dice
    when 1
      "Tu n'as rien trouver"
    when 2..5
      @life_points += 50
      @life_points = 100 if life_points > 100
      puts "Bravo tu as trouvé un pack de +50 points de vie\n\n"
    when 6
      @life_points += 80
      @life_points = 100 if life_points > 100
      puts "Woahou ! tu as trouvé un pack de 80 points de vie\n\n"
    end
  end

private

  def compute_damage
    rand(1..6) * weapon_level
  end
end
