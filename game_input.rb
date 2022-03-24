class GameInput

    # rearranges string => number before letter
    def reorder_move(move)
        return move.chars.sort.join
    end

    # gets move from player
    def get_move(token)
        puts "getting move"
        move = gets.strip
        puts "move reaaranged to #{reorder_move(move)}"
        return reorder_move(move)
    end
    
end