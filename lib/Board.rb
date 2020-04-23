require_relative 'BoardSquare'
require_relative 'Player'
class Board
    attr_accessor :grid, :playable
    
    def initialize
        @grid = [
                    [BoardSquare.new("A1"), BoardSquare.new("A2"), BoardSquare.new("A3")],
                    [BoardSquare.new("B1"), BoardSquare.new("B2"), BoardSquare.new("B3")],
                    [BoardSquare.new("C1"), BoardSquare.new("C2"), BoardSquare.new("C3")]
                ]
        @playable = ["A1","A2","A3","B1","B2","B3","C1","C2","C3"]
    end

    # Method - Update Board Square with Value:
    def update_board(index,value)
        @grid.each do |grid_line|
            grid_line.each do |board_square|
                if board_square.id == index
                    board_square.set_content(value)
                    @playable.delete(index.upcase)
                end
            end
        end
    end
end