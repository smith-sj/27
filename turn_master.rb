class TurnMaster

    def whos_turn(turn_count)
        return (turn_count % 2) == 0 ? "Crosses" : "Noughts"
    end

    def is_draw(turn_count)
        if turn_count >= 10
            return true
        end
    end
end