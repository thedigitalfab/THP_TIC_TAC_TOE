class Output
    # Method - Print Board:
    def print_board(board)
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
end