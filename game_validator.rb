class GameValidator

    VALID_MOVES = ["1a", "1b", "1c", "2a", "2b", "2c", "3a", "3b", "3c"]

    # Checks if the move is included in valid moves

    def is_valid(move)
        if !VALID_MOVES.include? move
          return false
        end
        return true
    end

    #converts move from "1a" to [0,0] etc.

    def move_converter(move, game, key)
        # make an array that we can edit, and return as a reference to where the move will go
        move_id = [0,0]
        key.each_with_index do |list,index|
            if list.include? move
                move_id[0] = index
                key[index].each_with_index do |child,index|
                    if child == move
                        move_id[1] = index
                    end
                end
            end 
        end
        return move_id
    end

    # Checks if move has already been played

    def is_unique(move, game, key)
        move_key = move_converter(move, game, key)
        if game[move_key[0]][move_key[1]] == " "
            return true
        else
            return false
        end
    end
end