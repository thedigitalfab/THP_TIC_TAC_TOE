class Player
    attr_reader :name, :sign
    
    def initialize(player_index,sign)
        puts "#{player_index}, enter your name:"
        @name = ask_player_name
        @sign = sign
    end

    private
    # Method - Ask for Player Name:
    def ask_player_name
        print ">"
        name = gets.chomp
        return name
    end
end