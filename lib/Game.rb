require_relative 'Player'
require_relative 'Board'

class Game
    attr_accessor :player_1, :player_2, :board, :current_player
    
    def initialize()
		@player_1 = Player.new("Player 1", "X")
		@player_2 = Player.new("Player 2", "O")
		@current_player = @player_1
		@board = Board.new()
    end

    # Game still running?:
    def is_still_ongoing?
        return !board.victory?(player_1) && !board.victory?(player_2) && !board.playable.empty?
    end

    # Play a round:
    def play_round()
        puts "#{current_player.name} joue:"
        puts "les coups jouables sont: #{board.playable}"
        board.update_board(ask_player_choice,current_player.sign)
        @current_player == @player_1 ? @current_player = @player_2 : @current_player = @player_1
        board.print_board
    end

    private
    # Method - Ask for Player Choice:
    def ask_player_choice
        puts "Quelle case voulez vous jouer ?"
        print "> "
        return gets.chomp.upcase
    end
end