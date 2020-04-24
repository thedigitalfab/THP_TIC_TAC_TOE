class Player
    attr_reader :name, :sign, :win
    
    def initialize(player_index,sign)
        puts "#{player_index}, enter your name:"
        @name = ask_player_name
        @sign = sign
        @win = 0
    end

    # Method player wins
    def player_wins
        return @win += 1
    end

    private
    # Method - Ask for Player Name:
    def ask_player_name
        print ">"
        name = gets.chomp
        return name
    end    
end