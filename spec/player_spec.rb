require_relative '../lib/Player'

describe "a Player" do
    context "When testing the Player class Init" do
        begin(:each)
            player = Player.new("Player 1","X")
        end
        it "test init" do
            expect(player).to be_instance_of(Player)
            expect(player).to respond_to(:player_wins)
            expect(player).to_not respond_to(:ask_player_name)
        end
        it "test accessor" do
            allow(player).to receive(:name) {"Michel"}
            expect(player).to have_attributes(name: "Michel")
            expect(player).to have_attributes(sign: "X")
            expect(player).to have_attributes(win: 0)
        end
    end
end
