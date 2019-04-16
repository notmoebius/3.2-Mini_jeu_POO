require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'

puts "---------------------------------------------------"
puts "|       Bienvenue à ILS VEULENT TOUS MA POO       |"
puts "| Le but du jeu est d'être le dernier survivant ! |"
puts "---------------------------------------------------\n\n"

puts "Quel est ton pseudo ? "
print ">"
name = gets.chomp

my_game = Game.new(name)

while my_game.is_still_ongoing? do
  my_game.show_players
  my_game.menu
  print ">"
  choice = gets.chomp
  puts "************************************************************************"
  my_game.menu_choice(choice)
  break if my_game.ennemies.empty?
  my_game.enemies_attack
end

my_game.end
