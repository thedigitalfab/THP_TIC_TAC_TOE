require_relative '../lib/player'

describe "a Player" do
    context "When testing the Player class Init" do
        it "test init" do
            expect(Player.new("Michel")).to be_instance_of(Player)
        end
        it "test accessor" do
            player_1 = Player.new("Michel")
            expect(player_1).to have_attributes(name: "Michel")
        end
    end
end
