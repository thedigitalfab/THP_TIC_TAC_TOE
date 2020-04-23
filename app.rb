require 'bundler'
Bundler.require

require_relative 'lib/Game'
require_relative 'lib/Output'

#Method - Welcome Message:
def welcome
    puts "---------------------------------"
    puts "| Bienvenue sur 'TIC TAC POO' ! |"
    puts "---------------------------------"
end


def perform
    # Clear Terminal
    Output.new.clear_terminal
    # Print Welcome message
    welcome

    # Init a new game:
    game = Game.new()
    puts "#{game.player_1.name} plays with #{game.player_1.sign}"
    puts "#{game.player_2.name} plays with #{game.player_2.sign}"

    # Start game:
    game.play_round()
end

perform

puts "Start a New game? y/N"
gets.chomp.upcase == "Y" ? perform : false