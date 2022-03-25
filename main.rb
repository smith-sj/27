# -----CONSTANTS-----
require_relative "game_output"
require_relative "game_input"
require_relative "turn_master"
require_relative "game_board"
require_relative "adjudicator"
require_relative "ai"
require_relative "player"
require_relative "game_modes"


# -----MAIN LOOP-----

GameOutput.new.start_screen()
game_mode =  gets.strip
system("cls") || system("clear")

while true

    if game_mode == "1"
        game_board = GameBoard.new
        game_squares = game_board.squares
        GameMode.new.p_v_p(game_squares)
        puts "Press ENTER to continue"
        gets
        GameOutput.new.start_screen()
        game_mode =  gets.strip
        system("cls") || system("clear")


    elsif game_mode == "2"
        game_board = GameBoard.new
        game_squares = game_board.squares
        GameMode.new.p_v_ai(game_squares)
        puts "Press ENTER to continue"
        gets
        GameOutput.new.start_screen()
        game_mode =  gets.strip
        system("cls") || system("clear")
        

    elsif game_mode == "3"
        game_board = GameBoard.new
        game_squares = game_board.squares
        GameMode.new.ai_v_ai(game_squares)
        puts "Press ENTER to continue"
        gets
        GameOutput.new.start_screen()
        game_mode =  gets.strip
        system("cls") || system("clear")

    else
        GameOutput.new.start_screen()
        puts "\nPlease type '1', '2' or '3' and press ENTER"
        game_mode =  gets.strip
        system("cls") || system("clear")
    end
end

