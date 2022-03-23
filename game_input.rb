class GameInput

    # rearranges string => number before letter
    def reorder_move(move)
        return move.chars.sort.join
    end

    # gets move from player
    def get_move(token)
        move = gets.strip
        return reorder_move(move)
    end
    
end