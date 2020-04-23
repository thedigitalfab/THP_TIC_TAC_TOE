class Output
    # Method - Print Board:
    def print_board(board)
        # Clear Terminal
        clear_terminal

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
    end

    def print_won_board(board,player)
        # Clear Terminal
        clear_terminal

        # Print Board
        for i in 0..2 do
            print "-" *13
            puts ""
            for j in 0..2 do
                print "| "
                if board.grid[i][j].get_content == player.sign
                    print "#{board.grid[i][j].get_content} ".light_green
                else
                    print "#{board.grid[i][j].get_content} "
                end
            end
            puts "|"
        end
        print "-" *13
        puts ""
    end

    def clear_terminal
        Gem.win_platform? ? (system "cls") : (system "clear")
    end
end