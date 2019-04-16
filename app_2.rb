require 'bundler'
Bundler.require

require_relative 'lib/player'

puts "---------------------------------------------------"
puts "|       Bienvenue à ILS VEULENT TOUS MA POO       |"
puts "| Le but du jeu est d'être le dernier survivant ! |"
puts "---------------------------------------------------\n\n"

puts "Quel est ton pseudo ? "
print ">"
name = gets.chomp

user = HumanPlayer.new(name)
ennemies = [Player.new("Josiane"), Player.new("José")]

while user.life_points > 0 do # && ennemies.any? { |ennemi| ennemi.life_points > 0 }  Pas la peine de vérifier si les ennemi sont en vie ici car le break if le fait
  user.show_state

  puts "Quelle action veux-tu effectuer ?"
  puts "a - Chercher une meilleure arme"
  puts "s - Se soigner"
  puts "\n\nAttaquer un joueur en vu:"

  ennemies.each_with_index do |ennemi, i| #j'utilise cette méthode pour ajouter l'indexation automatiquement si on ajoute des ennemis dans l'array.
    ennemi.life_points > 0 ? (puts "#{i} - " + ennemi.show_state) : (puts "#{i} - #{ennemi.name} est mort(e)")
  end
  print ">"
  choice = gets.chomp

  puts "----------------------------------------------------------------------"

  case choice
  when "a"
    user.search_weapon
  when "s"
    user.search_health_pack
  when "0", "1"
    ennemies[choice.to_i].life_points > 0 ? user.attacks(ennemies[choice.to_i]) : (puts "Tu t'acharnes sur un ennemi à terre ! Pauv' #{ennemies[choice.to_i].name}...")
  else
    puts "Cette touche n'a pas de choix tampis tu passe ton tour ! \n\n"
  end

break if ennemies.all? { |ennemi| ennemi.life_points <= 0 }

  puts "Les autres joueurs attaquent !"

  ennemies.each do |ennemi|  #On doit verifier user.life point avant chaque attaque d'ennemi car si un ennemi le tue, la boucle each continuera et des ennemi continuront à l'attaquer.
    ennemi.attacks(user) if user.life_points > 0 && ennemi.life_points > 0 #On verifie aussi que l'ennemi soit vivant pour qu'il attaque si non pas de sens.
  end  #Un ennemi peut attaquer uniquement si le joueur est en vie et que l'ennemi aussi est en vie
end

puts "La partie est finie !"

user.life_points > 0 ? (puts "Bravo ! Tu as gagné !") : (puts "Loser tu as perdu !")
