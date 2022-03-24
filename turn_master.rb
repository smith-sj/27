class TurnMaster

    def whos_turn(turn_count, player_x, player_o)
        return (turn_count % 2) == 0 ? "#{player_x}" : "#{player_o}"
    end

    def is_draw(turn_count)
        if turn_count >= 10
            return true
        end
    end
end