class GameOutput

    # Gameboard prints

    def print_game(to_print)
        system("cls") || system("clear")
        game_board = [
            ["|",to_print[0][0],"|",to_print[0][1],"|",to_print[0][2],"|"], 
            ["|",to_print[1][0],"|",to_print[1][1],"|",to_print[1][2],"|"], 
            ["|",to_print[2][0],"|",to_print[2][1],"|",to_print[2][2],"|"]]
    
        puts "\n      a b c\n\n"
        puts "  1  " + game_board[0].join
        puts "  2  " + game_board[1].join
        puts "  3  " + game_board[2].join
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