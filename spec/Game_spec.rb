require_relative '../lib/game'
require_relative '../lib/player'

describe "Game" do
    context "When testing the Game class Init" do
        it "test init" do
            expect(Game.new("Michel","Josette")).to be_instance_of(Game)
            expect(Game.new("Michel","Josette")).to respond_to(:start)
        end

        it "test accessor" do
            game = Game.new("Michel","Josette")
            expect(game.player_1).to be_instance_of(Player)
            expect(game.player_1).to have_attributes(name: "Michel")
            expect(game.player_2).to be_instance_of(Player)
            expect(game.player_2).to have_attributes(name: "Josette")
        end
    end

    context "When Starting a new game" do
        it "start a game" do
            expect(Game.new("Michel","Josette").start).to eq("new game")
        end
    end
end