require 'bundler'
Bundler.require

require_relative 'lib/Game'

def perform
    # Init a new game:
    game = Game.new
    
    # Start game:
    game.play_round
end

perform