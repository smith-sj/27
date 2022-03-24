class Adjudicator

    attr_reader :tally

    def initialize
        @tally = {x_score: 0, o_score: 0}
    end

    # tally up scores
    def tally_up(current_game)

        combo_key = ["xxx","ooo"]

        score_book = [
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
            (current_game[2][0][2] + current_game[2][1][1] + current_game[2][2][0]),]


        score_book.each do |combo|
            if combo == combo_key[0]
                @tally[:x_score] += 3
            elsif combo == combo_key[1]
                @tally[:o_score] += 3
            end
        end
        return @tally
    end

end