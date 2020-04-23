require_relative 'BoardCase'
require_relative 'Player'
class Board
    attr_accessor :grid, :playable
    def initialize
        @grid = [
                    [BoardCase.new("A1"), BoardCase.new("A2"), BoardCase.new("A3")],
                    [BoardCase.new("B1"), BoardCase.new("B2"), BoardCase.new("B3")],
                    [BoardCase.new("C1"), BoardCase.new("C2"), BoardCase.new("C3")]
                ]
        @playable = ["A1","A2","A3","B1","B2","B3","C1","C2","C3"]
    end

    # Method - Update Board Case with Value:
    def update_board(index,value)
        coordinates = index_to_coordinate(index.upcase)
        @grid[coordinates[0]][coordinates[1]].set_content(value)
        @playable.delete(index.upcase)
    end

    # Method - Test Victory:
    def victory?(player)
        return victory_lines?(player) || victory_columns?(player) || victory_cross?(player)
    end

    # Method - Print Board:
    def print_board
        for i in 0..2 do
            print "-" *13
            puts ""
            for j in 0..2 do
                print "| #{@grid[i][j].get_content} "
            end
            puts "|"
        end
        print "-" *13
        puts ""
    end

    private
    # Method - Translate Case index to Grid Coordinates:
    def index_to_coordinate(index)
        case index.slice(0)
        when "A"
            coordinate_x = 0
        when "B"
            coordinate_x = 1
        when "C"
            coordinate_x = 2
        end

        case index.slice(1)
        when "1"
            coordinate_y = 0
        when "2"
            coordinate_y = 1
        when "3"
            coordinate_y = 2
        end
        return coordinate_x, coordinate_y
    end

    # Method - Test if Victory on specific line:
    def victory_line?(index,player)
        return @grid[index].all?{|board_case| board_case.get_content == player.sign}
    end

    # Method - Test if Victory on lines:
    def victory_lines?(player)
        # Combinaisons gagnantes:
        # Lignes: A1*A2*A3, B1*B2*B3, C1*C2*C3
        return victory_line?(0,player) || victory_line?(1,player) || victory_line?(2,player)
    end

    # Method - Test if Victory on specific column:
    def victory_column?(index,player)
        return @grid.transpose[index].all?{|board_case| board_case.get_content == player.sign}
    end

    # Method - Test if Victory on columns:
    def victory_columns?(player)
        # Combinaisons gagnantes:
        # Colonnes: A1*B1*C1, A2*B2*C2,A3*B3*C3
        return victory_column?(0,player) || victory_column?(1,player) || victory_column?(2,player)
    end

    # Method - Test if Victory on Cross:
    def victory_cross?(player)
        # Combinaisons gagnantes:
        # Diagonales: A1*B2*C3, A3*B2*C1
        return victory_diag_down?(player) || victory_diag_up?(player)
    end
    
    # Method - Test if Victory on diagonal down (i.e.: A1,B2,C3)
    def victory_diag_down?(player)
        return [@grid[0][0].get_content, @grid[1][1].get_content, @grid[2][2].get_content] == [player.sign]*3
    end
    
    # Method - Test if Victory on diagonal up (i.e.: A3,B2,C1)
    def victory_diag_up?(player)
        return [@grid[0][2].get_content, @grid[1][1].get_content, @grid[2][0].get_content] == [player.sign]*3
    end
end