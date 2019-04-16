require_relative 'player'
class Game
  attr_accessor :human_player, :ennemies, :players_left

  def initialize(name)
    @human_player = HumanPlayer.new(name)
    @ennemies = [Player.new("Josiane"),
                 Player.new("José"),
                 Player.new("Robert"),
                 Player.new("Albert"),]
  end

  def kill_player(dead_player)
    ennemies.delete_if { |ennemi| ennemi == dead_player }  #on utilise @var car on ne travail plus avec l'objet direct mais l'objet contenu dans la var d'instance
  end

  def is_still_ongoing?
    human_player.life_points > 0 && !ennemies.empty?
  end

  def show_players
    puts "========= Le joueur #{human_player.name} a #{human_player.life_points} pv ========="
    puts "======== Il reste #{ennemies.length} ennemis en vie ======="
  end

  def menu
    puts "\n\nQuelle action veux-tu effectuer ?"
    puts "a - Chercher une meilleure arme"
    puts "s - Se soigner"
    puts "\n\nAttaquer un joueur en vu:"
    ennemies.each_with_index { |ennemi, i| puts "#{i} -" + ennemi.show_state }
  end

  def menu_choice(choice)
    case choice
    when "a"
      human_player.search_weapon
    when "s"
      human_player.search_health_pack
    when "0", "1", "2", "3"
      begin
        human_player.attacks(ennemies[choice.to_i])
        kill_player(ennemies[choice.to_i]) if ennemies[choice.to_i].life_points <= 0  #rescue d'une NoMethodeError au cas où un joueur meurt et qu'on tape quand même une commande
      rescue NoMethodError                                                           #pour attacker un joueur mort.
        puts "Cette touche n'a pas de choix tampis tu passe ton tour ! \n\n"
      end
    else
      puts "Cette touche n'a pas de choix tampis tu passe ton tour ! \n\n"
    end
  end

  def enemies_attack
    puts "Les autres joueurs attaquent !"
    ennemies.each { |ennemi| ennemi.attacks(human_player) if human_player.life_points > 0 }
  end

  def end
    puts "Le jeu est fini !"
    ennemies.all? {|ennemi| ennemi.life_points <= 0} ? (puts "Bravo ! Tu as gagné !") : (puts "Loser ! Tu as perdu !")
  end
end
