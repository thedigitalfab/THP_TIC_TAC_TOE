require_relative '../lib/Board'
require_relative '../lib/BoardSquare'

describe "Board" do
    context "When testing the Board class Init" do
        begin(:each)
            my_board = Board.new()
        end

        it "test init" do
            expect(my_board).to be_instance_of(Board)
        end

        it "test accessor" do
            #expect(my_board).to have_attributes(board: [[be_instance_of(BoardSquare),be_instance_of(BoardSquare),be_instance_of(BoardSquare)],[be_instance_of(BoardSquare),be_instance_of(BoardSquare),be_instance_of(BoardSquare)],[be_instance_of(BoardSquare),be_instance_of(BoardSquare),be_instance_of(BoardSquare)]])
        end
    end
end