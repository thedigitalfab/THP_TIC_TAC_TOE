require_relative '../lib/Board'
require_relative '../lib/BoardCase'

describe "Board" do
    context "When testing the Board class Init" do
        begin(:each)
            my_board = BoardCase.new()
        end

        it "test init" do
            expect(my_board).to be_instance_of(Board)
        end

        it "test accessor" do
            #expect(my_board).to have_attributes(board: [[be_instance_of(BoardCase),be_instance_of(BoardCase),be_instance_of(BoardCase)],[be_instance_of(BoardCase),be_instance_of(BoardCase),be_instance_of(BoardCase)],[be_instance_of(BoardCase),be_instance_of(BoardCase),be_instance_of(BoardCase)]])
        end
    end
end