require_relative 'Player'
require_relative 'Board'
require_relative 'Output'

class Game
    attr_accessor :player_1, :player_2, :board, :current_player
    
    def initialize
		# Clear Terminal
        Output.new.clear_terminal
        
        # Print Welcome message
        Output.new.welcome
        
        @player_1 = Player.new("Player 1", "X")
		@player_2 = Player.new("Player 2", "O")
    end

    # Play a round:
    def play_round
        init_round
        
        while is_still_ongoing?
            play_turn()
        end
        
        end_game

        puts "Start a New round? y/N"
        gets.chomp.upcase == "Y" ? play_round : false
    end

    # Method - Test Victory:
    def victory?(player)
        return victory_lines?(player) || victory_columns?(player) || victory_cross?(player)
    end

    private
    # Method - Ask for Player Choice:
    def ask_player_choice
        puts "Choose box to play:"
        print "> "
        return gets.chomp.upcase
    end

    # Game still running?:
    def is_still_ongoing?
        return !victory?(player_1) && !victory?(player_2) && !board.playable.empty?
    end

    # Play turn:
    def play_turn()
        Output.new.print_board(board,@player_1,@player_2,@current_player)
        board.update_board(ask_player_choice,current_player.sign)
        @current_player == @player_1 ? @current_player = @player_2 : @current_player = @player_1
    end

    # Method - Test if Victory on lines:
    def victory_lines?(player)
        # Combinaisons gagnantes:
        # Lignes: A1*A2*A3, B1*B2*B3, C1*C2*C3
        return victory_line?(0,player) || victory_line?(1,player) || victory_line?(2,player)
    end

    # Method - Test if Victory on specific line:
    def victory_line?(index,player)
        return board.grid[index].all?{|board_case| board_case.get_content == player.sign}
    end

    # Method - Test if Victory on columns:
    def victory_columns?(player)
        # Combinaisons gagnantes:
        # Colonnes: A1*B1*C1, A2*B2*C2,A3*B3*C3
        return victory_column?(0,player) || victory_column?(1,player) || victory_column?(2,player)
    end

    # Method - Test if Victory on specific column:
    def victory_column?(index,player)
        return board.grid.transpose[index].all?{|board_case| board_case.get_content == player.sign}
    end

    # Method - Test if Victory on Cross:
    def victory_cross?(player)
        # Combinaisons gagnantes:
        # Diagonales: A1*B2*C3, A3*B2*C1
        return victory_diag_down?(player) || victory_diag_up?(player)
    end

    # Method - Test if Victory on diagonal down (i.e.: A1,B2,C3)
    def victory_diag_down?(player)
        return [board.grid[0][0].get_content, board.grid[1][1].get_content, board.grid[2][2].get_content] == [player.sign]*3
    end

    # Method - Test if Victory on diagonal up (i.e.: A3,B2,C1)
    def victory_diag_up?(player)
        return [board.grid[0][2].get_content, board.grid[1][1].get_content, board.grid[2][0].get_content] == [player.sign]*3
    end

    #Ending game:
    def end_game
        if victory?(@player_1)
            @player_1.player_wins
            Output.new.print_won_board(board,@player_1,@player_2,@player_1)
        elsif victory?(@player_2)
            @player_2.player_wins
            Output.new.print_won_board(board,@player_1,@player_2,@player_2)
        else
            puts "Match nul"
        end
    end

    # Init a Round:
    def init_round
        @current_player = @player_1
        @board = Board.new()
        puts "#{@player_1.name} plays with #{@player_1.sign}"
        puts "#{@player_2.name} plays with #{@player_2.sign}"
    end
end