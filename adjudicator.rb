class Adjudicator

    initialize
        @tally = {:x => 0, :o => 0}

        COMBO_KEY = ["ooo","xxx"]
        
        2D_SCORE_BOOK = [
            # board 1
            (current_game[0][0][0] + current_game[0][0][1] + current_game[0][0][2]),
            (current_game[0][1][0] + current_game[0][1][1] + current_game[0][1][2]),
            (current_game[0][2][0] + current_game[0][2][1] + current_game[0][2][2]),
            (current_game[0][0][0] + current_game[0][1][0] + current_game[0][2][0]),
            (current_game[0][0][1] + current_game[0][1][1] + current_game[0][2][1]),
            (current_game[0][0][2] + current_game[0][1][2] + current_game[0][2][2]),
            (current_game[0][0][0] + current_game[0][1][1] + current_game[0][2][2]),
            (current_game[0][0][2] + current_game[0][1][1] + current_game[0][2][0]),
            # board 2
            (current_game[1][0][0] + current_game[1][0][1] + current_game[1][0][2]),
            (current_game[1][1][0] + current_game[1][1][1] + current_game[1][1][2]),
            (current_game[1][2][0] + current_game[1][2][1] + current_game[1][2][2]),
            (current_game[1][0][0] + current_game[1][1][0] + current_game[1][2][0]),
            (current_game[1][0][1] + current_game[1][1][1] + current_game[1][2][1]),
            (current_game[1][0][2] + current_game[1][1][2] + current_game[1][2][2]),
            (current_game[1][0][0] + current_game[1][1][1] + current_game[1][2][2]),
            (current_game[1][0][2] + current_game[1][1][1] + current_game[1][2][0]),
            # board 3
            (current_game[2][0][0] + current_game[2][0][1] + current_game[2][0][2]),
            (current_game[2][1][0] + current_game[2][1][1] + current_game[2][1][2]),
            (current_game[2][2][0] + current_game[2][2][1] + current_game[2][2][2]),
            (current_game[2][0][0] + current_game[2][1][0] + current_game[2][2][0]),
            (current_game[2][0][1] + current_game[2][1][1] + current_game[2][2][1]),
            (current_game[2][0][2] + current_game[2][1][2] + current_game[2][2][2]),
            (current_game[2][0][0] + current_game[2][1][1] + current_game[2][2][2]),
            (current_game[2][0][2] + current_game[2][1][1] + current_game[2][2][0]),
        ]

    end

    # tally up scores
    def tally_up(current_game)
        if == (current_game[0][0][0] + current_game[0][0][1] + current_game[0][0][2])
            puts "#{player} wins!"
            return true
        elsif WIN.include? (current_game[0][1][0] + current_game[0][1][1] + current_game[0][1][2])
            puts "#{player} wins!"
            return true
        elsif WIN.include? (current_game[0][2][0] + current_game[0][2][1] + current_game[0][2][2])
            puts "#{player} wins!"
            return true
        elsif WIN.include? (current_game[0][0][0] + current_game[0][1][0] + current_game[0][2][0])
            puts "#{player} wins!"
            return true
        elsif WIN.include? (current_game[0][0][1] + current_game[0][1][1] + current_game[0][2][1])
            puts "#{player} wins!"
            return true
        elsif WIN.include? (current_game[0][0][2] + current_game[0][1][2] + current_game[0][2][2])
            puts "#{player} wins!"
            return true
        elsif WIN.include? (current_game[0][0][0] + current_game[0][1][1] + current_game[0][2][2])
            puts "#{player} wins!"
            return true
        elsif WIN.include? (current_game[0][0][2] + current_game[0][1][1] + current_game[0][2][0])
            puts "#{player} wins!"
            return true
        else
            return false
        end
    end

end