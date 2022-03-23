# -----CONSTANTS-----
require_relative "game_output"
require_relative "game_validator"
require_relative "adjudicator"
require_relative "game_input"
require_relative "turn_master"
require_relative "game_board"

# Players
CROSS = "x"
NOUGHT = "o" 

# -----VARIABLES-----

# A labeled game board for referencing
GAME_KEY = [
    ["1a","1b","1c"],
    ["2a","2b","2c"],
    ["3a","3b","3c"]]

# The current game that is being played
board1 = GameBoard.new
board1_squares = board1.squares

turn_count = 0


# Add current move to game

def add_move(player, move, game, key)
    move_key = GameValidator.new.move_converter(move, game, key)
    game[move_key[0]][move_key[1]] = player
end

# Play a turn
def play_turn(player_name, token, board1_squares)    

    # Print current game
    GameOutput.new.print_game(board1_squares)

    # Check move is valid and unique
    while true
        GameOutput.new.prompt_move(player_name)
        move = GameInput.new.get_move(token)

        if GameValidator.new.is_valid(move) && GameValidator.new.is_unique(move, board1_squares, GAME_KEY)
            add_move(token, move, board1_squares, GAME_KEY)
            GameOutput.new.print_game(board1_squares)
            break
        elsif !GameValidator.new.is_valid(move)
            GameOutput.new.print_game(board1_squares)
            puts "\nInvalid Move! Try again.\n"
        else
            GameOutput.new.print_game(board1_squares)
            puts "\n#{move} is taken! Try again.\n"
        end
    end
end

# -----MAIN LOOP-----

while true

    turn_count += 1
    player_name = TurnMaster.new.whos_turn(turn_count)
    token = player_name == "Crosses" ? CROSS : NOUGHT

    if TurnMaster.new.is_draw(turn_count)
        puts "It's a draw"
        return false
    end

    play_turn(player_name, token, board1_squares)
    
    if Adjudicator.new.is_winner(board1_squares, player_name)
        return false
    end
end