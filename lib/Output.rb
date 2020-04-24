class Output
    # Method - Print Board:
    def print_board(board,player1,player2,current_player)
        # Clear Terminal
        clear_terminal

        # Repeat welcome message
        welcome

        # Repeat ScoreBoard:
        puts "ScoreBoard: #{player1.name} - #{player1.win} | #{player2.name} - #{player2.win} "
        puts ""

        # Print Board
        for i in 0..2 do
            print "-" *13
            puts ""
            for j in 0..2 do
                print "| "
                if board.grid[i][j].get_content == "X"
                    print "#{board.grid[i][j].get_content} ".light_red
                elsif board.grid[i][j].get_content == "O"
                    print "#{board.grid[i][j].get_content} ".light_blue
                else
                    print "#{board.grid[i][j].get_content} "
                end
            end
            puts "|"
        end
        print "-" *13
        puts ""
        puts ""
        
        puts "#{current_player.name} plays:".yellow
        puts "Playable boxes are: #{board.playable}"
    end

    def print_won_board(board,player1,player2,winner)
        # Clear Terminal
        clear_terminal

        # Repeat welcome message
        welcome
        
        # Print Board
        for i in 0..2 do
            print "-" *13
            puts ""
            for j in 0..2 do
                print "| "
                if board.grid[i][j].get_content == winner.sign
                    print "#{board.grid[i][j].get_content} ".light_green
                else
                    print "#{board.grid[i][j].get_content} "
                end
            end
            puts "|"
        end
        print "-" *13
        puts ""
        puts ""

        puts "Victoire de: #{winner.name} !".yellow
        puts "ScoreBoard: #{player1.name} - #{player1.win} | #{player2.name} - #{player2.win} ".yellow
    end

    def clear_terminal
        Gem.win_platform? ? (system "cls") : (system "clear")
    end

    #Method - Welcome Message:
    def welcome
        puts "---------------------------------"
        puts "| Bienvenue sur 'TIC TAC POO' ! |"
        puts "---------------------------------"
        puts ""
    end
end