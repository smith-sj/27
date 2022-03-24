class GameOutput

    # Gameboard prints

    def print_game(to_print)
        printed_rows = [
            ["|",to_print[0][0][0],"|",to_print[0][0][1],"|",to_print[0][0][2],"|","    ","|",to_print[1][0][0],"|",to_print[1][0][1],"|",to_print[1][0][2],"|","    ","|",to_print[2][0][0],"|",to_print[2][0][1],"|",to_print[2][0][2],"|"], 
            ["|",to_print[0][1][0],"|",to_print[0][1][1],"|",to_print[0][1][2],"|","    ","|",to_print[1][1][0],"|",to_print[1][1][1],"|",to_print[1][1][2],"|","    ","|",to_print[2][1][0],"|",to_print[2][1][1],"|",to_print[2][1][2],"|"], 
            ["|",to_print[0][2][0],"|",to_print[0][2][1],"|",to_print[0][2][2],"|","    ","|",to_print[1][2][0],"|",to_print[1][2][1],"|",to_print[1][2][2],"|","    ","|",to_print[2][2][0],"|",to_print[2][2][1],"|",to_print[2][2][2],"|"]]
    
        puts "\n      a b c\n\n"
        puts "  1  " + printed_rows[0].join
        puts "  2  " + printed_rows[1].join
        puts "  3  " + printed_rows[2].join
        puts "\n"
    end

    # Prompts

    def prompt_move (player)
        puts "\n#{player}, where would you like to go?\n"
    end

    # Line break

    # Errors

    errors = []

    def print_error (error)
    end

end