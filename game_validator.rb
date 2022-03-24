class GameValidator

    VALID_MOVES = ["1a", "1b", "1c", "2a", "2b", "2c", "3a", "3b", "3c","4a", "4b", "4c", "5a", "5b", "5c", "6a", "6b", "6c","7a", "7b", "7c", "8a", "8b", "8c", "9a", "9b", "9c"]

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
        move_id = [0,0,0]
        # puts "starting move conversion"

        key.each_with_index do |board,index|
            # puts "checking board #{key[index]} for #{move}"
            if key[index].join.include? "#{move}"
                # puts "found #{move}!"
                # puts "move key_ID board is #{index}"
                move_id[0] = index
                key[index].each_with_index do |row,index2|
                    if row.include? move
                        # puts "move key_ID row is #{index2}"
                        move_id[1] = index2
                        key[index][index2].each_with_index do |column,index3|
                            if column == move
                                # puts "move key_ID column is #{index3}"
                                move_id[2] = index3
                            end
                        end
                    end
                end
            end
        end
        # puts "converting"
        return move_id
    end

    # Checks if move has already been played

    def is_unique(move, game, key)
        move_key = move_converter(move, game, key)
        # puts "current move key is #{move_key}"
        if game[move_key[0]][move_key[1]][move_key[2]] == " "
            return true
        else
            return false
        end
    end
end