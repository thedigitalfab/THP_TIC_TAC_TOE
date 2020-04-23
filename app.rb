require 'bundler'
Bundler.require

require_relative 'lib/game'

#Method - Welcome Message:
def welcome
    puts "---------------------------------"
    puts "| Bienvenue sur 'TIC TAC POO' ! |"
    puts "---------------------------------"
end


def perform
    # Print Welcome message
    welcome

    # Init a new game:
    game = Game.new()
    puts "#{game.player_1.name} plays with #{game.player_1.sign}"
    puts "#{game.player_2.name} plays with #{game.player_2.sign}"

    # Start game:
    while game.is_still_ongoing?
        game.play_round()
    end

    #Ending game:
    if game.board.victory?(game.player_1)
        puts "Victoire de player 1"
    elsif game.board.victory?(game.player_2)
        puts "Victoire de player 2"
    else
        puts "Match nul"
    end
end

perform

puts "Start a New game? y/N"
gets.chomp.upcase == "Y" ? perform : false