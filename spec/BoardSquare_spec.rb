require_relative '../lib/BoardSquare'

describe "BoardCase" do
    context "When testing the BoardCase class Init" do
        begin(:each)
            board_case = BoardCase.new("A3")
        end
        it "test init" do
            expect(board_case).to be_instance_of(BoardCase)
            expect(board_case).to respond_to(:get_content)
            expect(board_case).to respond_to(:set_content)
            expect(board_case).to_not respond_to(:get_played_state)
            expect(board_case).to_not respond_to(:set_played_state)
        end

        it "test accessor" do
            expect(board_case).to have_attributes(id: "A3")
            expect(board_case).to have_attributes(played_state: false)
            expect(board_case).to have_attributes(content: ".")
        end
    end

    context "When dealing with the BoardCase content" do
        begin(:each)
            board_case = BoardCase.new("A3")
        end

        it "Get initial BoardCase content" do
            expect(board_case.get_content).to eq(".")
        end

        it "Set unplayed BoardCase content" do
            expect(board_case.set_content("X")).to eq("X")
            expect(board_case.get_content).to eq("X")
        end

        it "Set played BoardCase content" do
            expect(board_case.set_content("X")).to eq("X")
            expect(board_case.get_content).to eq("X")
            expect(board_case.set_content("O")).to eq("X")
            expect(board_case.get_content).to eq("X")
        end
    end

    context "When dealing with the BoardCase state" do
        begin(:each)
            board_case = BoardCase.new("A3")
        end

        it "Get initial BoardCase content" do
            expect(board_case.send(:get_played_state)).to eq(false)
        end

        it "Set unplayed BoardCase content" do
            expect(board_case.set_content("X")).to eq("X")
            expect(board_case.send(:get_played_state)).to eq(true)
        end
    end
end