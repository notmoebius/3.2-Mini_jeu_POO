require 'bundler'
Bundler.require

require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")

while (player1.life_points > 0) && (player2.life_points > 0) do
  puts "\n\nVoici l'état de chaque joueur:"
  puts player1.show_state
  puts player2.show_state

  puts "\n\nPassons à la phase d'attaque !"

  player1.attacks(player2)
  break if player2.life_points <= 0
  player2.attacks(player1)
end
