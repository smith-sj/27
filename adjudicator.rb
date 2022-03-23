class Adjudicator

    WIN = ["ooo","xxx"]

    # Check if current player is a winner
    def is_winner(current_game, player)
        if WIN.include? (current_game[0][0] + current_game[0][1] + current_game[0][2])
            puts "#{player} wins!"
            return true
        elsif WIN.include? (current_game[1][0] + current_game[1][1] + current_game[1][2])
            puts "#{player} wins!"
            return true
        elsif WIN.include? (current_game[2][0] + current_game[2][1] + current_game[2][2])
            puts "#{player} wins!"
            return true
        elsif WIN.include? (current_game[0][0] + current_game[1][0] + current_game[2][0])
            puts "#{player} wins!"
            return true
        elsif WIN.include? (current_game[0][1] + current_game[1][1] + current_game[2][1])
            puts "#{player} wins!"
            return true
        elsif WIN.include? (current_game[0][2] + current_game[1][2] + current_game[2][2])
            puts "#{player} wins!"
            return true
        elsif WIN.include? (current_game[0][0] + current_game[1][1] + current_game[2][2])
            puts "#{player} wins!"
            return true
        elsif WIN.include? (current_game[0][2] + current_game[1][1] + current_game[2][0])
            puts "#{player} wins!"
            return true
        else
            return false
        end
    end

end