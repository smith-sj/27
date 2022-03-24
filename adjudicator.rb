class Adjudicator

    attr_reader :tally

    def initialize
        @tally = {x_score: 0, o_score: 0}
    end

    # tally up scores
    def tally_up(current_game)

        combo_key = ["xxx","ooo"]

        flats_points = 3
        pillars_points = 2
        stairs_points = 2
        diamond_stairs_points = 2


        flats = [
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

        pillars = [
            (current_game[0][0][0] + current_game[1][0][0] + current_game[2][0][0]),
            (current_game[0][0][1] + current_game[1][0][1] + current_game[2][0][1]),
            (current_game[0][0][2] + current_game[1][0][2] + current_game[2][0][2]),
            (current_game[0][1][0] + current_game[1][1][0] + current_game[2][1][0]),
            (current_game[0][1][1] + current_game[1][1][1] + current_game[2][1][1]),
            (current_game[0][1][2] + current_game[1][1][2] + current_game[2][1][2]),
            (current_game[0][2][0] + current_game[1][2][0] + current_game[2][2][0]),
            (current_game[0][2][1] + current_game[1][2][1] + current_game[2][2][1]),
            (current_game[0][2][2] + current_game[1][2][2] + current_game[2][2][2]),]

        stairs = [
            (current_game[0][0][0] + current_game[1][0][1] + current_game[2][0][2]),
            (current_game[0][1][0] + current_game[1][1][1] + current_game[2][1][2]),
            (current_game[0][2][0] + current_game[1][2][1] + current_game[2][2][2]),
            (current_game[0][2][0] + current_game[1][1][0] + current_game[2][0][0]),
            (current_game[0][2][1] + current_game[1][1][1] + current_game[2][0][1]),
            (current_game[0][2][2] + current_game[1][1][2] + current_game[2][0][2]),
            (current_game[0][2][2] + current_game[1][2][1] + current_game[2][2][0]),
            (current_game[0][1][2] + current_game[1][1][1] + current_game[2][1][0]),
            (current_game[0][0][2] + current_game[1][0][1] + current_game[2][0][0]),
            (current_game[0][0][2] + current_game[1][1][2] + current_game[2][2][2]),
            (current_game[0][0][1] + current_game[1][1][1] + current_game[2][2][1]),
            (current_game[0][0][0] + current_game[1][1][0] + current_game[2][2][0]),]
            
            
        diamond_stairs = [
            (current_game[0][0][0] + current_game[1][1][1] + current_game[2][2][2]),
            (current_game[0][2][0] + current_game[1][1][1] + current_game[2][0][2]),
            (current_game[0][2][2] + current_game[1][1][1] + current_game[2][0][0]),
            (current_game[0][0][2] + current_game[1][1][1] + current_game[2][2][0]),]



        flats.each do |combo|
            if combo == combo_key[0]
                @tally[:x_score] += flats_points
            elsif combo == combo_key[1]
                @tally[:o_score] += flats_points
            end
        end

        pillars.each do |combo|
            if combo == combo_key[0]
                @tally[:x_score] += pillars_points
            elsif combo == combo_key[1]
                @tally[:o_score] += pillars_points
            end
        end

        stairs.each do |combo|
            if combo == combo_key[0]
                @tally[:x_score] += stairs_points
            elsif combo == combo_key[1]
                @tally[:o_score] += stairs_points
            end
        end

        diamond_stairs.each do |combo|
            if combo == combo_key[0]
                @tally[:x_score] += diamond_stairs_points
            elsif combo == combo_key[1]
                @tally[:o_score] += diamond_stairs_points
            end
        end

        return @tally
    end

end