class TurnMaster
    
    attr_accessor :turn_count

    def initialize()
        turn_count = -1
    end

    def whos_turn(turn_count, player_x, player_o)
        return (turn_count % 2) == 0 ? "#{player_x}" : "#{player_o}"
    end

end