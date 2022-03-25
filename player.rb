require_relative "game_output"
require_relative "game_validator"
require_relative "game_input"
require_relative "game_board"
require_relative "adjudicator"


class Player

        # Add current move to game
    def add_move(player, move, game)
        move_key = GameValidator.new.move_converter(move)
        game[move_key[0]][move_key[1]][move_key[2]] = player
    end

    # Play a turn
    def play_turn(player_x, player_o, player_name, token, game_squares)
        x_tally = Adjudicator.new.tally_up(game_squares)[:x_tally]
        o_tally = Adjudicator.new.tally_up(game_squares)[:o_tally]

        # Print current game
        GameOutput.new.print_game(player_x, player_o, game_squares, x_tally, o_tally)

        # Starts a loop, in case move is invalid
        while true
            #get the move
            GameOutput.new.prompt_move(player_name)
            move = GameInput.new.get_move

            if GameValidator.new.is_valid(move) && GameValidator.new.is_unique(move, game_squares)
                # puts "move is valid and unique"
                add_move(token, move, game_squares)
                # puts "added move"
                GameOutput.new.print_game(player_x, player_o, game_squares, x_tally, o_tally)
                break
            elsif !GameValidator.new.is_valid(move)
                # puts "move is invalid"
                GameOutput.new.print_game(player_x, player_o, game_squares, x_tally, o_tally)
                puts "\nInvalid Move! Try again.\n"
            elsif !GameValidator.new.is_unique(move, game_squares)
                # puts "stacking move on next board"
                move[0..0]= ((move[0]).to_i + 3).to_s
                # puts "new move is: #{move}"
                if GameValidator.new.is_valid(move) && GameValidator.new.is_unique(move, game_squares)
                    # puts "move is valid and unique"
                    add_move(token, move, game_squares)
                    # puts "added move"
                    GameOutput.new.print_game(player_x, player_o, game_squares, x_tally, o_tally)
                    break
                elsif !GameValidator.new.is_valid(move)
                    # puts "move is invalid"
                    GameOutput.new.print_game(player_x, player_o, game_squares, x_tally, o_tally)
                    puts "\nInvalid Move! Try again.\n"
                elsif !GameValidator.new.is_unique(move, game_squares)
                    # puts "stacking move on next board"
                    move[0..0]= ((move[0]).to_i + 3).to_s
                    # puts "new move is: #{move}"
                    if GameValidator.new.is_valid(move) && GameValidator.new.is_unique(move, game_squares)
                        # puts "move is valid and unique"
                        add_move(token, move, game_squares)
                        # puts "added move"
                        GameOutput.new.print_game(player_x, player_o, game_squares, x_tally, o_tally)
                        break
                    elsif !GameValidator.new.is_valid(move)
                        # puts "move is invalid"
                        GameOutput.new.print_game(player_x, player_o, game_squares, x_tally, o_tally)
                        puts "\nInvalid Move! Try again.\n"
                    elsif !GameValidator.new.is_unique(move, game_squares)
                        GameOutput.new.print_game(player_x, player_o, game_squares, x_tally, o_tally)
                        puts "\nStack is full! Try again.\n"
                    end
                end
            end
        end
    end

end