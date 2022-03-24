# -----CONSTANTS-----
require_relative "game_output"
require_relative "game_validator"
require_relative "game_input"
require_relative "turn_master"
require_relative "game_board"
require_relative "adjudicator"

# Players
CROSS = "x"
NOUGHT = "o" 

# -----VARIABLES-----

# A labeled game board for referencing
GAME_KEY = [

    [["1a","1b","1c"],
    ["2a","2b","2c"],
    ["3a","3b","3c"]],

    [["4a","4b","4c"],
    ["5a","5b","5c"],
    ["6a","6b","6c"]],

    [["7a","7b","7c"],
    ["8a","8b","8c"],
    ["9a","9b","9c"]],
]

# The current game that is being played
board1 = GameBoard.new
board1_squares = board1.squares


# Add current move to game

def add_move(player, move, game, key)
    move_key = GameValidator.new.move_converter(move, game, key)
    # puts "converted move is #{move_key}"
    game[move_key[0]][move_key[1]][move_key[2]] = player
end

# Play a turn
def play_turn(player_x, player_o, player_name, token, board1_squares)
    x_tally = Adjudicator.new.tally_up(board1_squares)[:x_tally]
    o_tally = Adjudicator.new.tally_up(board1_squares)[:o_tally]
    # Print current game
    GameOutput.new.print_game(player_x, player_o, board1_squares, x_tally, o_tally)

    # Check move is valid and unique
    while true
        # puts "prompting player"
        GameOutput.new.prompt_move(player_name)
        move = GameInput.new.get_move(token)
        # puts "move is currently #{move}"
        if GameValidator.new.is_valid(move) && GameValidator.new.is_unique(move, board1_squares, GAME_KEY)
            # puts "move is valid and unique"
            add_move(token, move, board1_squares, GAME_KEY)
            # puts "added move"
            GameOutput.new.print_game(player_x, player_o, board1_squares, x_tally, o_tally)
            break
        elsif !GameValidator.new.is_valid(move)
            # puts "move is invalid"
            GameOutput.new.print_game(player_x, player_o, board1_squares, x_tally, o_tally)
            puts "\nInvalid Move! Try again.\n"
        elsif !GameValidator.new.is_unique(move, board1_squares, GAME_KEY)
            # puts "stacking move on next board"
            move[0..0]= ((move[0]).to_i + 3).to_s
            # puts "new move is: #{move}"
            if GameValidator.new.is_valid(move) && GameValidator.new.is_unique(move, board1_squares, GAME_KEY)
                # puts "move is valid and unique"
                add_move(token, move, board1_squares, GAME_KEY)
                # puts "added move"
                GameOutput.new.print_game(player_x, player_o, board1_squares, x_tally, o_tally)
                break
            elsif !GameValidator.new.is_valid(move)
                # puts "move is invalid"
                GameOutput.new.print_game(player_x, player_o, board1_squares, x_tally, o_tally)
                puts "\nInvalid Move! Try again.\n"
            elsif !GameValidator.new.is_unique(move, board1_squares, GAME_KEY)
                # puts "stacking move on next board"
                move[0..0]= ((move[0]).to_i + 3).to_s
                # puts "new move is: #{move}"
                if GameValidator.new.is_valid(move) && GameValidator.new.is_unique(move, board1_squares, GAME_KEY)
                    # puts "move is valid and unique"
                    add_move(token, move, board1_squares, GAME_KEY)
                    # puts "added move"
                    GameOutput.new.print_game(player_x, player_o, board1_squares, x_tally, o_tally)
                    break
                elsif !GameValidator.new.is_valid(move)
                    # puts "move is invalid"
                    GameOutput.new.print_game(player_x, player_o, board1_squares, x_tally, o_tally)
                    puts "\nInvalid Move! Try again.\n"
                elsif !GameValidator.new.is_unique(move, board1_squares, GAME_KEY)
                    GameOutput.new.print_game(player_x, player_o, board1_squares, x_tally, o_tally)
                    puts "Stack is full! Try again.\n"
                end
            end
        end
    end
end

# -----MAIN LOOP-----
system("cls") || system("clear")
puts "Player x, enter name: "
player_x = gets.strip
puts "Player o, enter name: "
player_o = gets.strip

turn_count = -1

while true
    turn_count += 1
    player_name = TurnMaster.new.whos_turn(turn_count, player_x, player_o)
    token = player_name == "#{player_x}" ? CROSS : NOUGHT

    play_turn(player_x, player_o, player_name, token, board1_squares)
    if turn_count >= 26
        x_tally = Adjudicator.new.tally_up(board1_squares)[:x_tally]
        o_tally = Adjudicator.new.tally_up(board1_squares)[:o_tally]
        GameOutput.new.print_game(player_x, player_o, board1_squares, x_tally, o_tally)
        x_final_tally = Adjudicator.new.tally_up(board1_squares)[:x_tally].to_i
        o_final_tally = Adjudicator.new.tally_up(board1_squares)[:o_tally].to_i
        if x_final_tally > o_final_tally
            puts "Game over! #{player_x} wins!"
        elsif x_final_tally < o_final_tally
            puts "Game over! #{player_o} wins!"
        else
            puts "\nGame over! It's a draw."
        end
        break
    end
end